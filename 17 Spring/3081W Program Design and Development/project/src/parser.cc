/*******************************************************************************
 * Name            : parser.h
 * Project         : fcal
 * Module          : parser
 * Copyright       : 2017 CSCI3081W Staff. All rights reserved.
 * Original Author : Erik Van Wyk
 * Modifications by: Dan Challou, John Harwell
 *
 ******************************************************************************/

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "include/parser.h"
#include <assert.h>
#include <stdio.h>
#include "include/ext_token.h"
#include "include/scanner.h"
#include "include/ast.h"

/*******************************************************************************
 * Namespaces
 ******************************************************************************/
namespace fcal {
namespace parser {

/*******************************************************************************
 * Constructors/Destructor
 ******************************************************************************/
Parser::~Parser() {
  if (scanner_) delete scanner_;

  scanner::ExtToken *to_delete1;
  curr_token_ = tokens_;
  while (curr_token_) {
    to_delete1 = curr_token_;
    curr_token_ = curr_token_->next();
    delete to_delete1;
  } /* while() */

  scanner::Token *curr_scanner_token = stokens_;
  scanner::Token *to_delete2;
  while (curr_scanner_token) {
    to_delete2 = curr_scanner_token;
    curr_scanner_token = curr_scanner_token->get_next();
    delete to_delete2;
  } /* while() */
} /* Parser::~Parser() */

ParseResult Parser::Parse(const char *text) {
  assert(text != NULL);

  ParseResult pr;
  try {
  scanner_ = new scanner::Scanner();
  stokens_ = scanner_->Scan(text);
  tokens_ = tokens_->ExtendTokenList(this, stokens_);

  assert(tokens_ != NULL);
  curr_token_ = tokens_;
  pr = ParseProgram();
  }
  catch (std::string errMsg) {
    pr.ok(false);
    pr.errors(errMsg);
    pr.ast(NULL);
  }
  return pr;
} /* Parser::parse() */

/*
 * parse methods for non-terminal symbols
 * --------------------------------------
 */

// Program
ParseResult Parser::ParseProgram() {
  ParseResult pr;
  ast::Program* pr_ast;
  // root
  // Program ::= varName '(' ')' '{' Stmts '}'
  match(scanner::kVariableName);
  std::string pr_var = prev_token_->lexeme();
  match(scanner::kLeftParen);
  match(scanner::kRightParen);
  match(scanner::kLeftCurly);
  ParseResult pr_stmts = parse_stmts();
  match(scanner::kRightCurly);
  match(scanner::kEndOfFile);
  pr_ast = new ast::Program(pr_var, dynamic_cast<ast::Stmts*>(pr_stmts.ast()));
  pr.ast(pr_ast);
  return pr;
} /* Parser::ParseProgram() */

// MatrixDecl
// identical purpose of parse_decl, handles special matrix syntax.
ParseResult Parser::parse_matrix_decl() {
  ParseResult pr;
  ast::Decl* pr_ast;

  match(scanner::kMatrixKwd);
  match(scanner::kVariableName);
  std::string pr_var1 = prev_token_->lexeme();

  // Decl ::= 'matrix' varName '[' Expr ':' Expr ']' varName ':' varName  '='
  // Expr ';'
  if (attempt_match(scanner::kLeftSquare)) {
    ParseResult expr1 = parse_expr(0);
    match(scanner::kColon);
    ParseResult expr2 = parse_expr(0);
    match(scanner::kRightSquare);
    ParseResult pr_var2 = parse_variable_name();
    match(scanner::kColon);
    ParseResult pr_var3 = parse_variable_name();
    match(scanner::kAssign);
    ParseResult expr3 = parse_expr(0);
    pr_ast = new ast::MatrixIndexDecl(pr_var1, \
                                   dynamic_cast<ast::Expr*>(expr1.ast()),      \
                                   dynamic_cast<ast::Expr*>(expr2.ast()),      \
                                   dynamic_cast<ast::varName*>(pr_var2.ast()), \
                                   dynamic_cast<ast::varName*>(pr_var3.ast()), \
                                   dynamic_cast<ast::Expr*>(expr3.ast()));
  } else if (attempt_match(scanner::kAssign)) {
    // Decl ::= 'matrix' varName '=' Expr ';'
    ParseResult expr1 = parse_expr(0);
    pr_ast = new ast::MatrixDecl(pr_var1,                                      \
                                         dynamic_cast<ast::Expr*>(expr1.ast()));
  } else {
    throw((std::string) "Bad Syntax of Matrix Decl in in parseMatrixDecl");
  }

  match(scanner::kSemiColon);
  pr.ast(pr_ast);
  return pr;
}
// standardDecl
// Decl ::= integerKwd varName | floatKwd varName | stringKwd varName
ParseResult Parser::parse_standard_decl() {
  ParseResult pr;
  ast::VarDecl* pr_ast;
  std::string type;
  if (attempt_match(scanner::kIntKwd)) {
    // Type ::= intKwd
    type = "int";
  } else if (attempt_match(scanner::kFloatKwd)) {
    // Type ::= floatKwd
    type = "float";
  } else if (attempt_match(scanner::kStringKwd)) {
    // Type ::= stringKwd
    type = "string";
  } else if (attempt_match(scanner::kBoolKwd)) {
    // Type ::= boolKwd
    type = "boolean";
  }
  match(scanner::kVariableName);
  std::string var = prev_token_->lexeme();
  match(scanner::kSemiColon);
  pr_ast = new ast::VarDecl(type, var);
  pr.ast(pr_ast);
  return pr;
}

// Decl
ParseResult Parser::parse_decl() {
  ParseResult pr;
  // Decl :: matrix variableName ....
  if (next_is(scanner::kMatrixKwd)) {
    pr = parse_matrix_decl();
  } else {
    // Decl ::= Type variableName semiColon
    pr = parse_standard_decl();
  }
  return pr;
}

// Stmts
ParseResult Parser::parse_stmts() {
  ParseResult pr;
  ast::Stmts* pr_ast;
  if (!next_is(scanner::kRightCurly) && !next_is(scanner::kInKwd)) {
    // Stmts ::= Stmt Stmts
    ParseResult pr_stmt = parse_stmt();
    ParseResult pr_stmts = parse_stmts();
    pr_ast = new ast::SeqStmts(dynamic_cast<ast::Stmt*>(pr_stmt.ast()), \
              dynamic_cast<ast::Stmts*>(pr_stmts.ast()));
  } else {
    // Stmts ::=
    // nothing to match.k
    pr_ast = new ast::EmptyStmts();
  }
  pr.ast(pr_ast);
  return pr;
}

// Stmt
ParseResult Parser::parse_stmt() {
  ParseResult pr;
  ast::Stmt* pr_ast;
  // Stmt ::= Decl
  if (next_is(scanner::kIntKwd) || next_is(scanner::kFloatKwd) ||
      next_is(scanner::kMatrixKwd) || next_is(scanner::kStringKwd) ||
      next_is(scanner::kBoolKwd)) {
    ParseResult decl = parse_decl();
    pr_ast = new ast::DeclStmt(dynamic_cast<ast::Decl*>(decl.ast()));
  } else if (attempt_match(scanner::kLeftCurly)) {
    // Stmt ::= '{' Stmts '}'
    ParseResult stmts = parse_stmts();
    match(scanner::kRightCurly);
    pr_ast = new ast::StmtsStmt(dynamic_cast<ast::Stmts*>(stmts.ast()));
  } else if (attempt_match(scanner::kIfKwd)) {
    // Stmt ::= 'if' '(' Expr ')' Stmt
    // Stmt ::= 'if' '(' Expr ')' Stmt 'else' Stmt
    match(scanner::kLeftParen);
    ParseResult expr = parse_expr(0);
    match(scanner::kRightParen);
    ParseResult stmt1 = parse_stmt();
    pr_ast = new ast::IfStmt(dynamic_cast<ast::Expr*>(expr.ast()), \
              dynamic_cast<ast::Stmt*>(stmt1.ast()));
    if (attempt_match(scanner::kElseKwd)) {
      ParseResult stmt2 = parse_stmt();
      pr_ast = new ast::IfElseStmt(dynamic_cast<ast::Expr*>(expr.ast()), \
                dynamic_cast<ast::Stmt*>(stmt1.ast()), \
                dynamic_cast<ast::Stmt*>(stmt2.ast()));
    }
  } else if (attempt_match(scanner::kVariableName)) {
    /*
     * Stmt ::= varName '=' Expr ';'  | varName '[' Expr ':' Expr ']'
     * '=' Expr ';'
     */
    std::string var = prev_token_->lexeme();
    if (attempt_match(scanner::kLeftSquare)) {
      ParseResult expr1 = parse_expr(0);
      match(scanner::kColon);
      ParseResult expr2 = parse_expr(0);
      match(scanner::kRightSquare);
      match(scanner::kAssign);
      ParseResult expr3 = parse_expr(0);
      match(scanner::kSemiColon);
      pr_ast = new ast::MatrixAssignStmt(var,                                  \
                                        dynamic_cast<ast::Expr*>(expr1.ast()), \
                                        dynamic_cast<ast::Expr*>(expr2.ast()), \
                                        dynamic_cast<ast::Expr*>(expr3.ast()));
    } else {
    match(scanner::kAssign);
    ParseResult expr = parse_expr(0);
    match(scanner::kSemiColon);
    pr_ast = new ast::AssignStmt(var, dynamic_cast<ast::Expr*>(expr.ast()));
    }

  } else if (attempt_match(scanner::kPrintKwd)) {
    // Stmt ::= 'print' '(' Expr ')' ';'
    match(scanner::kLeftParen);
    ParseResult expr = parse_expr(0);
    match(scanner::kRightParen);
    match(scanner::kSemiColon);
    pr_ast = new ast::PrintStmt(dynamic_cast<ast::Expr*>(expr.ast()));
  } else if (attempt_match(scanner::kRepeatKwd)) {
    // Stmt ::= 'repeat' '(' varName '=' Expr 'to' Expr ')' Stmt
    match(scanner::kLeftParen);
    match(scanner::kVariableName);
    std::string var = prev_token_->lexeme();
    match(scanner::kAssign);
    ParseResult expr1 = parse_expr(0);
    match(scanner::kToKwd);
    ParseResult expr2 = parse_expr(0);
    match(scanner::kRightParen);
    ParseResult stmt = parse_stmt();
    pr_ast = new ast::RepeatStmt(var, dynamic_cast<ast::Expr*>(expr1.ast()),   \
    dynamic_cast<ast::Expr*>(expr2.ast()),                                     \
                                          dynamic_cast<ast::Stmt*>(stmt.ast()));
  } else if (attempt_match(scanner::kWhileKwd)) {
    // Stmt ::= 'while' '(' Expr ')' Stmt
    match(scanner::kLeftParen);
    ParseResult expr = parse_expr(0);
    match(scanner::kRightParen);
    ParseResult stmt = parse_stmt();
    pr_ast = new ast::WhileStmt(dynamic_cast<ast::Expr*>(expr.ast()), \
                                          dynamic_cast<ast::Stmt*>(stmt.ast()));
  } else if (attempt_match(scanner::kSemiColon)) {
    // Stmt ::= ';
    // parsed a skip
    pr_ast = new ast::SCStmt();
  } else {
    throw(make_error_msg(curr_token_->terminal()) +
          " while parsing a statement");
  }
  // Stmt ::= variableName assign Expr semiColon
  pr.ast(pr_ast);
  return pr;
}

// Expr
ParseResult Parser::parse_expr(int rbp) {
  /* Examine current token, without consuming it, to call its
     associated parse methods.  The ExtToken objects have 'nud' and
     'led' methods that are dispatchers that call the appropriate
     parse methods.*/
  ParseResult left = curr_token_->nud();

  while (rbp < curr_token_->lbp()) {
    left = curr_token_->led(left);
  }

  return left;
}

/*
 * parse methods for Expr productions
 * ----------------------------------
 */

// Expr ::= trueKwd
ParseResult Parser::parse_true_kwd() {
  ParseResult pr;
  match(scanner::kTrueKwd);
  ast::TrueExpr* pr_ast = new ast::TrueExpr();
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= falseKwd
ParseResult Parser::parse_false_kwd() {
  ParseResult pr;
  ast::FalseExpr* pr_ast = new ast::FalseExpr();
  pr.ast(pr_ast);
  match(scanner::kFalseKwd);
  return pr;
}

// Expr ::= intConst
ParseResult Parser::parse_int_const() {
  ParseResult pr;
  match(scanner::kIntConst);
  std::string var = prev_token_->lexeme();
  ast::IntConstExpr* pr_ast = new ast::IntConstExpr(var);
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= floatConst
ParseResult Parser::parse_float_const() {
  ParseResult pr;
  match(scanner::kFloatConst);
  std::string var = prev_token_->lexeme();
  ast::FloatConstExpr* pr_ast = new ast::FloatConstExpr(var);
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= stringConst
ParseResult Parser::parse_string_const() {
  ParseResult pr;
  match(scanner::kStringConst);
  std::string var = prev_token_->lexeme();
  ast::StringConstExpr* pr_ast = new ast::StringConstExpr(var);
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= variableName .....
ParseResult Parser::parse_variable_name() {
  ParseResult pr;
  ast::Expr* pr_ast;
  match(scanner::kVariableName);
  std::string var = prev_token_->lexeme();
  if (attempt_match(scanner::kLeftSquare)) {
    ParseResult expr1 = parse_expr(0);
    match(scanner::kColon);
    ParseResult expr2 = parse_expr(0);
    match(scanner::kRightSquare);
    pr_ast = new ast::MatrixExpr(var, dynamic_cast<ast::Expr*>(expr1.ast()),   \
                                         dynamic_cast<ast::Expr*>(expr2.ast()));
  }  else if (attempt_match(scanner::kLeftParen)) {
    // Expr ::= varableName '(' Expr ')'
    ParseResult expr = parse_expr(0);
    pr_ast = new ast::FuncExpr(var, dynamic_cast<ast::Expr*>(expr.ast()));
    match(scanner::kRightParen);
  } else {
    // variable
    pr_ast = new ast::varName(var);
  }
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= leftParen Expr rightParen
ParseResult Parser::parse_nested_expr() {
  ParseResult pr;
  ast::ParenExpr* pr_ast;
  match(scanner::kLeftParen);
  ParseResult expr = parse_expr(0);
  match(scanner::kRightParen);
  pr_ast = new ast::ParenExpr(dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= 'if' Expr 'then' Expr 'else' Expr
ParseResult Parser::parse_if_expr() {
  ParseResult pr;
  ast::IfElseExpr* pr_ast;
  match(scanner::kIfKwd);
  ParseResult expr1 = parse_expr(0);
  match(scanner::kThenKwd);
  ParseResult expr2 = parse_expr(0);
  match(scanner::kElseKwd);
  ParseResult expr3 = parse_expr(0);
  pr_ast = new ast::IfElseExpr(dynamic_cast<ast::Expr*>(expr1.ast()), \
  dynamic_cast<ast::Expr*>(expr2.ast()), dynamic_cast<ast::Expr*>(expr3.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= 'let' Stmts 'in' Expr 'end'
ParseResult Parser::parse_let_expr() {
  ParseResult pr;
  ast::LetExpr* pr_ast;
  match(scanner::kLetKwd);
  ParseResult stmts = parse_stmts();
  match(scanner::kInKwd);
  ParseResult expr = parse_expr(0);
  match(scanner::kEndKwd);
  pr_ast = new ast::LetExpr(dynamic_cast<ast::Stmts*>(stmts.ast()), \
                                          dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= '!' Expr
ParseResult Parser::parse_not_expr() {
  ParseResult pr;
  ast::NotExpr* pr_ast;
  match(scanner::kNotOp);
  ParseResult expr = parse_expr(0);
  pr_ast = new ast::NotExpr(dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}
// Expr ::= Expr plusSign Expr
ParseResult Parser::parse_addition(ParseResult prLeft) {
  // parser has already matchekD left expression
  ParseResult pr;
  ast::PlusExpr* pr_ast;
  match(scanner::kPlusSign);
  ParseResult expr = parse_expr(prev_token_->lbp());
  pr_ast = new ast::PlusExpr(dynamic_cast<ast::Expr*>(prLeft.ast()), \
                                          dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= Expr star Expr
ParseResult Parser::parse_multiplication(ParseResult prLeft) {
  // parser has already matchekD left expression
  ParseResult pr;
  ast::TimesExpr* pr_ast;
  match(scanner::kStar);
  ParseResult expr = parse_expr(prev_token_->lbp());
  pr_ast = new ast::TimesExpr(dynamic_cast<ast::Expr*>(prLeft.ast()), \
                                          dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= Expr dash Expr
ParseResult Parser::parse_subtraction(ParseResult prLeft) {
  // parser has already matchekD left expression
  ParseResult pr;
  ast::MinusExpr* pr_ast;
  match(scanner::kDash);
  ParseResult expr = parse_expr(prev_token_->lbp());
  pr_ast = new ast::MinusExpr(dynamic_cast<ast::Expr*>(prLeft.ast()), \
                                          dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= Expr forwardSlash Expr
ParseResult Parser::parse_division(ParseResult prLeft) {
  // parser has already matchekD left expression
  ParseResult pr;
  ast::DivideExpr* pr_ast;
  match(scanner::kForwardSlash);
  ParseResult expr = parse_expr(prev_token_->lbp());
  pr_ast = new ast::DivideExpr(dynamic_cast<ast::Expr*>(prLeft.ast()), \
                                          dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Expr ::= Expr equalEquals Expr
// Expr ::= Expr lessThanEquals Expr
// Expr ::= Expr greaterThanEquals Expr
// Expr ::= Expr notEquals Expr
// Expr ::= Expr leftAngle Expr
// Expr ::= Expr rightAngle Expr
/* Notice that for relational operators we use just one parse
   function.  This shows another possible means for implementing
   expressions, as opposed to the method used for arithmetic
   expressions in which each operation has its own parse method.  It
   will depend on what we do in iteration 3 in building an abstract
   syntax tree to decide which method is better.
*/
ParseResult Parser::parse_relational_expr(ParseResult prLeft) {
  // parser has already matchekD left expression
  ParseResult pr;
  ast::RelationalExpr* pr_ast;
  next_token();
  // just advance token, since examining it in parse_expr caused
  // this method being called.
  std::string op = prev_token_->lexeme();

  ParseResult expr = parse_expr(prev_token_->lbp());
  pr_ast = new ast::RelationalExpr(dynamic_cast<ast::Expr*>(prLeft.ast()), \
                                      op, dynamic_cast<ast::Expr*>(expr.ast()));
  pr.ast(pr_ast);
  return pr;
}

// Helper function used by the parser.

void Parser::match(const scanner::TokenType &tt) {
  if (!attempt_match(tt)) {
    throw(make_error_msg_expected(tt));
  }
}

bool Parser::attempt_match(const scanner::TokenType &tt) {
  if (curr_token_->terminal() == tt) {
    next_token();
    return true;
  }
  return false;
}

bool Parser::next_is(const scanner::TokenType &tt) {
  return curr_token_->terminal() == tt;
}

void Parser::next_token() {
  if (curr_token_ == NULL) {
    throw(std::string(
        "Internal Error: should not call nextToken in unitialized state"));
  } else if (curr_token_->terminal() == scanner::kEndOfFile &&
           curr_token_->next() == NULL) {
    prev_token_ = curr_token_;
  } else if (curr_token_->terminal() != scanner::kEndOfFile &&
             curr_token_->next() == NULL) {
    throw(make_error_msg("Error: tokens end with endOfFile"));
  } else {
    prev_token_ = curr_token_;
    curr_token_ = curr_token_->next();
  }
}

std::string Parser::terminal_description(const scanner::TokenType &terminal) {
  scanner::Token *dummy_token = new scanner::Token("", terminal, NULL);
  scanner::ExtToken *dummy_ext_token = new scanner::ExtToken(this, dummy_token);
  std::string s = dummy_ext_token->                                            \
                                  ExtendToken(this, dummy_token)->description();
  delete dummy_token;
  delete dummy_ext_token;
  return s;
}

std::string Parser::make_error_msg_expected(
    const scanner::TokenType &terminal) {
  std::string s = (std::string) "Expected " + terminal_description(terminal) +
                  " but found " + curr_token_->description();
  return s;
}

std::string Parser::make_error_msg(const scanner::TokenType &terminal) {
  std::string s = "Unexpected symbol " + terminal_description(terminal);
  return s;
}

std::string Parser::make_error_msg(const char *msg) { return msg; }

} /* namespace parser */
} /* namespace fcal */
