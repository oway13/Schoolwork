/*******************************************************************************
 * Name            : ast.h
 * Project         : fcal
 * Module          : ast
 * Description     : Header file for AST
 * Copyright       : 2017 CSCI3081W Staff. All rights reserved.
 * Original Author : Eric Van Wyk
 * Modifications by: John Harwell
 ******************************************************************************/

#ifndef PROJECT_INCLUDE_AST_H_
#define PROJECT_INCLUDE_AST_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include <iostream>
#include <string>
#include "include/scanner.h"

/*******************************************************************************
 * Namespaces
 ******************************************************************************/
namespace fcal {
namespace ast {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/

/*! Abstract class used as the parent of all of the AST classes to be used by
 *  the parser to generate and AST and unparse a parsed program
 */
class Node {
 public:
  virtual std::string unparse(void) { return " This should be pure virtual "; }
  virtual std::string CppCode(void) { return " This should be pure virtual"; }
  virtual ~Node(void) {}
};

class Stmts : public Node {};
class Stmt : public Node {};
class Decl : public Node {};
class Expr : public Node {};

class varName : public Expr {
 public:
  explicit varName(std::string var) {
    _var = var;
  }
  std::string unparse() {
    return _var;
  }
  std::string CppCode() {
    return _var;
  }
 private:
  std::string _var;
};

class Program : public Node {
 public:
  Program(std::string var, Stmts* stmts) {
    _var = var;
    _stmts = stmts;
  }
  std::string unparse() {
    return _var+"() {"+_stmts->unparse()+"}";
  }
  std::string CppCode() {
    // The linter fails here, but this is an exception to the line length rule.
    return "#include <iostream>\n#include \"include/Matrix.h\"\n#include <math.h>\nusing namespace std;\n"+ \
            _var+"(){\n"+_stmts->CppCode()+"\n}";
  }
 private:
  Stmts* _stmts;
  std::string _var;
};

/* Stmts */
class EmptyStmts : public Stmts {
 public:
  std::string unparse() {
    return "";
  }
  std::string CppCode() {
    return "";
  }
};

class SeqStmts : public Stmts {
 public:
  SeqStmts(Stmt* stmt, Stmts* stmts) {
    _stmt = stmt;
    _stmts = stmts;
  }
  std::string unparse() {
    return _stmt->unparse()+_stmts->unparse();
  }
  std::string CppCode() {
    return _stmt->CppCode()+_stmts->CppCode();
  }
 private:
  Stmt* _stmt;
  Stmts* _stmts;
};

/* Stmt */
class DeclStmt : public Stmt {
 public:
  explicit DeclStmt(Decl* decl) {
    _decl = decl;
  }
  std::string unparse() {
    return _decl->unparse();
  }
  std::string CppCode() {
    return _decl->CppCode();
  }
 private:
  Decl* _decl;
};

class StmtsStmt : public Stmt {
 public:
  explicit StmtsStmt(Stmts* stmts) {
    _stmts = stmts;
  }
  std::string unparse() {
    return "{"+_stmts->unparse()+"}";
  }
  std::string CppCode() {
    return "{\n"+_stmts->CppCode()+"}\n";
  }
 private:
  Stmts* _stmts;
};

class IfStmt : public Stmt {
 public:
  IfStmt(Expr* expr, Stmt* stmt) {
    _expr = expr;
    _stmt = stmt;
  }
  std::string unparse() {
    return "if("+_expr->unparse()+")"+_stmt->unparse();
  }
  std::string CppCode() {
    return "if ( "+_expr->CppCode()+" ) "+_stmt->CppCode();
  }
 private:
  Expr* _expr;
  Stmt* _stmt;
};

class IfElseStmt : public Stmt {
 public:
  IfElseStmt(Expr* expr, Stmt* stmt1, Stmt* stmt2) {
    _expr = expr;
    _stmt1 = stmt1;
    _stmt2 = stmt2;
  }
  std::string unparse() {
    return "if("+_expr->unparse()+")"+_stmt1->unparse()+"else"+                \
            _stmt2->unparse();
  }
  std::string CppCode() {
    return "if ( "+_expr->CppCode()+" ) \n"+_stmt1->CppCode()+" else \n"+      \
            _stmt2->CppCode();
  }
 private:
  Expr* _expr;
  Stmt* _stmt1;
  Stmt* _stmt2;
};

class AssignStmt : public Stmt {
 public:
  AssignStmt(std::string var, Expr* expr) {
    _var = var;
    _expr = expr;
  }
  std::string unparse() {
    return _var+"="+_expr->unparse()+";";
  }
  std::string CppCode() {
    return _var+" = "+_expr->CppCode()+";\n";
  }
 private:
  std::string _var;
  Expr* _expr;
};

class MatrixAssignStmt : public Stmt {
 public:
  MatrixAssignStmt(std::string var, Expr* expr1, Expr* expr2, Expr* expr3) {
    _var = var;
    _expr1 = expr1;
    _expr2 = expr2;
    _expr3 = expr3;
  }
  std::string unparse() {
    return _var+"["+_expr1->unparse()+":"+_expr2->unparse()+"]="+              \
            _expr3->unparse()+";";
  }
  std::string CppCode() {
    return "*("+_var+".access("+_expr1->CppCode()+", "+                        \
    _expr2->CppCode()+")) = "+_expr3->CppCode()+";";
  }

 private:
  std::string _var;
  Expr* _expr1;
  Expr* _expr2;
  Expr* _expr3;
};

class PrintStmt : public Stmt {
 public:
  explicit PrintStmt(Expr* expr) {
    _expr = expr;
  }
  std::string unparse() {
    return "print("+_expr->unparse()+");";
  }
  std::string CppCode() {
    return "cout << "+_expr->CppCode()+";\n";
  }
 private:
  Expr* _expr;
};

class RepeatStmt : public Stmt {
 public:
  RepeatStmt(std::string var, Expr* expr1, Expr* expr2, Stmt* stmt) {
    _var = var;
    _expr1 = expr1;
    _expr2 = expr2;
    _stmt = stmt;
  }
  std::string unparse() {
    return "repeat("+_var+"="+_expr1->unparse()+" to "+                        \
            _expr2->unparse()+")"+_stmt->unparse();
  }
  std::string CppCode() {
    return "for ("+_var+" = "+_expr1->CppCode()+"; "+_var+" <= "+              \
          _expr2->CppCode()+"; "+_var+"++ ) \n"+_stmt->CppCode();
  }
 private:
  std::string _var;
  Expr* _expr1;
  Expr* _expr2;
  Stmt* _stmt;
};

class WhileStmt : public Stmt {
 public:
  WhileStmt(Expr* expr, Stmt* stmt) {
    _expr = expr;
    _stmt = stmt;
  }
  std::string unparse() {
    return "while("+_expr->unparse()+")"+_stmt->unparse();
  }
  std::string CppCode() {
    return "while ( "+_expr->CppCode()+" )\n"+_stmt->CppCode();
  }
 private:
  Expr* _expr;
  Stmt* _stmt;
};

class SCStmt : public Stmt {
 public:
  std::string unparse() {
    return ";";
  }
  std::string CppCode() {
    return ";";
  }
};

/* Decl */
class VarDecl : public Decl {
 public:
  VarDecl(std::string type, std::string var) {
    _type = type;
    _var = var;
  }
  std::string unparse() {
    return _type+" "+_var+";";
  }
  std::string CppCode() {
    return _type+" "+_var+";\n";
  }
 private:
  std::string _type;
  std::string _var;
};


class MatrixIndexDecl : public Decl {
 public:
  MatrixIndexDecl(std::string var1, Expr* expr1, Expr* expr2,                  \
                  varName* var2, varName* var3, Expr* expr3) {
    _var1 = var1;
    _var2 = var2;
    _var3 = var3;
    _expr1 = expr1;
    _expr2 = expr2;
    _expr3 = expr3;
  }
  std::string unparse() {
    return "matrix "+_var1+"["+_expr1->unparse()+":"+                          \
            _expr2->unparse()+"]"+_var2->unparse()+":"+_var3->unparse()+"="+   \
            _expr3->unparse()+";";
  }
  std::string CppCode() {
    return "matrix "+_var1+"("+_expr1->CppCode()+", "+_expr2->CppCode()+       \
          ");\nfor (int "+_var2->CppCode()+" = 0; "+_var2->CppCode()+" < "+    \
          _expr1->CppCode()+"; "+_var2->CppCode()+"++) {\n\t for (int "+       \
          _var3->CppCode()+" = 0; "+_var3->CppCode()+" < "+_expr2->CppCode()+  \
          "; "+_var3->CppCode()+"++) {\n\t\t*("+_var1+".access("+              \
          _var2->CppCode()+", "+_var3->CppCode()+")) = "+_expr3->CppCode()+    \
          ";\n\t}\n}\n";
  }

 private:
  std::string _var1;
  varName* _var2;
  varName* _var3;
  Expr* _expr1;
  Expr* _expr2;
  Expr* _expr3;
};

class MatrixDecl : public Decl {
 public:
  MatrixDecl(std::string var, Expr* expr) {
    _var = var;
    _expr = expr;
  }
  std::string unparse() {
    return "matrix "+_var+"="+_expr->unparse()+";";
  }
  std::string CppCode() {
    return "matrix "+_var+" = "+_expr->CppCode()+";\n";
  }
 private:
  std::string _var;
  Expr* _expr;
};

/* Terminal Expr */


class StringConstExpr : public Expr {
 public:
  explicit StringConstExpr(std::string var) {
    _var = var;
  }
  std::string unparse() {
    return _var;
  }
  std::string CppCode() {
    return _var;
  }
 private:
  std::string _var;
};

class IntConstExpr : public Expr {
 public:
  explicit IntConstExpr(std::string var) {
    _var = var;
  }
  std::string unparse() {
    return _var;
  }
  std::string CppCode() {
    return _var;
  }
 private:
  std::string _var;
};

class FloatConstExpr : public Expr {
 public:
  explicit FloatConstExpr(std::string var) {
    _var = var;
  }
  std::string unparse() {
    return _var;
  }
  std::string CppCode() {
    return _var;
  }
 private:
  std::string _var;
};

class TrueExpr : public Expr {
 public:
  std::string unparse() {
    return "True";
  }
  std::string CppCode() {
    return "true";
  }
};
class FalseExpr : public Expr {
 public:
  std::string unparse() {
    return "False";
  }
  std::string CppCode() {
    return "false";
  }
};

/* Binary Op Expr */
class TimesExpr : public Expr {
 public:
  TimesExpr(Expr* expr1, Expr* expr2) {
    _expr1 = expr1;
    _expr2 = expr2;
  }
  std::string unparse() {
    return _expr1->unparse()+"*"+_expr2->unparse();
  }
  std::string CppCode() {
    return "("+_expr1->CppCode()+" * "+_expr2->CppCode()+")";
  }
 private:
  Expr* _expr1;
  Expr* _expr2;
};
class DivideExpr : public Expr {
 public:
  DivideExpr(Expr* expr1, Expr* expr2) {
    _expr1 = expr1;
    _expr2 = expr2;
  }
  std::string unparse() {
    return _expr1->unparse()+"/"+_expr2->unparse();
  }
  std::string CppCode() {
    return "("+_expr1->CppCode()+" / "+_expr2->CppCode()+")";
  }
 private:
  Expr* _expr1;
  Expr* _expr2;
};
class PlusExpr : public Expr {
 public:
  PlusExpr(Expr* expr1, Expr* expr2) {
    _expr1 = expr1;
    _expr2 = expr2;
  }
  std::string unparse() {
    return _expr1->unparse()+"+"+_expr2->unparse();
  }
  std::string CppCode() {
    return "("+_expr1->CppCode()+" + "+_expr2->CppCode()+")";
  }
 private:
  Expr* _expr1;
  Expr* _expr2;
};
class MinusExpr : public Expr {
 public:
  MinusExpr(Expr* expr1, Expr* expr2) {
    _expr1 = expr1;
    _expr2 = expr2;
  }
  std::string unparse() {
    return _expr1->unparse()+"-"+_expr2->unparse();
  }
  std::string CppCode() {
    return "("+_expr1->CppCode()+" - "+_expr2->CppCode()+")";
  }
 private:
  Expr* _expr1;
  Expr* _expr2;
};

class RelationalExpr : public Expr {
 public:
  RelationalExpr(Expr* expr1, std::string op, Expr* expr2) {
    _expr1 = expr1;
    _op = op;
    _expr2 = expr2;
  }
  std::string unparse() {
    return _expr1->unparse()+_op+_expr2->unparse();
  }
  std::string CppCode() {
    return _expr1->CppCode()+_op+_expr2->CppCode();
  }
 private:
  Expr* _expr1;
  std::string _op;
  Expr* _expr2;
};

/* Call Expr */
class MatrixExpr : public Expr {
 public:
  MatrixExpr(std::string var, Expr* expr1, Expr* expr2) {
    _var = var;
    _expr1 = expr1;
    _expr2 = expr2;
  }
  std::string unparse() {
    return _var+"["+_expr1->unparse()+":"+_expr2->unparse()+"]";
  }
  std::string CppCode() {
    return "*("+_var+".access("+_expr1->CppCode()+", "+_expr2->CppCode()+"))";
  }
 private:
  std::string _var;
  Expr* _expr1;
  Expr* _expr2;
};

class FuncExpr : public Expr {
 public:
  FuncExpr(std::string var, Expr* expr) {
    _var = var;
    _expr = expr;
  }
  std::string unparse() {
    return _var+"("+_expr->unparse()+")";
  }
  std::string CppCode() {
    if (_var.compare(0, 12, "n_rows", 6) == 0 ||                               \
                                        _var.compare(0, 12, "n_cols", 6) == 0) {
      return _expr->CppCode()+"."+_var+"()";
    } else if (_var.compare(0, 12, "matrix_read", 11) == 0) {
      _var = "matrix::"+_var;
    }
      return _var+"( "+_expr->CppCode()+" )";
    }
 private:
  std::string _var;
  Expr* _expr;
};

class ParenExpr : public Expr {
 public:
  explicit ParenExpr(Expr* expr) {
    _expr = expr;
  }
  std::string unparse() {
    return "("+_expr->unparse()+")";
  }
  std::string CppCode() {
    return "( "+_expr->CppCode()+" )";
  }
 private:
  Expr* _expr;
};

class LetExpr : public Expr {
 public:
  LetExpr(Stmts* stmts, Expr* expr) {
    _stmts = stmts;
    _expr = expr;
  }
  std::string unparse() {
    return "let "+_stmts->unparse()+" in "+_expr->unparse()+" end";
  }
  std::string CppCode() {
    return "({"+_stmts->CppCode()+"\n"+_expr->CppCode()+";})";
  }
 private:
  Stmts* _stmts;
  Expr* _expr;
};

class IfElseExpr : public Expr {
 public:
  IfElseExpr(Expr* expr1, Expr* expr2, Expr* expr3) {
    _expr1 = expr1;
    _expr2 = expr2;
    _expr3 = expr3;
  }
  std::string unparse() {
    return "if "+_expr1->unparse()+" then "+_expr2->unparse()+" else "+        \
            _expr3->unparse();
  }
  std::string CppCode() {
    return "("+_expr1->CppCode()+" ? "+_expr2->CppCode()+" : "+                \
            _expr3->CppCode()+")";
  }
 private:
  Expr* _expr1;
  Expr* _expr2;
  Expr* _expr3;
};

class NotExpr : public Expr {
 public:
  explicit NotExpr(Expr* expr) {
    _expr = expr;
  }
  std::string unparse() {
    return "!"+_expr->unparse();
  }
  std::string CppCode() {
    return "!"+_expr->CppCode();
  }
 private:
  Expr* _expr;
};

} /* namespace ast */
} /* namespace fcal */

#endif  // PROJECT_INCLUDE_AST_H_
