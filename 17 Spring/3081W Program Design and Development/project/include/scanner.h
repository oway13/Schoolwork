/*******************************************************************************
 * Name            : scanner.h
 * Project         : fcal
 * Module          : scanner
 * Description     : Header file for scanner module
 * Copyright       : 2017 CSCI3081W Staff. All rights reserved.
 * Original Author : Eric Van Wyk
 * Modifications by: John Harwel, Wyatt Kormick, Andrew Johnson
 ******************************************************************************/

#ifndef PROJECT_INCLUDE_SCANNER_H_
#define PROJECT_INCLUDE_SCANNER_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include <regex.h>
#include <string>
#include "include/regex.h"



/*******************************************************************************
 * Namespaces
 ******************************************************************************/
namespace fcal {
namespace scanner {

/* below are the possible terminal types for each token */

enum kTokenEnumType {
  kIntKwd,
  kFloatKwd,
  kBoolKwd,
  kTrueKwd,
  kFalseKwd,
  kStringKwd,
  kMatrixKwd,
  kLetKwd,
  kInKwd,
  kEndKwd,
  kIfKwd,
  kThenKwd,
  kElseKwd,
  kRepeatKwd,
  kWhileKwd,
  kPrintKwd,
  kToKwd,

  // Constants
  kIntConst,
  kFloatConst,
  kStringConst,

  // Names
  kVariableName,

  // Punctuation
  kLeftParen,
  kRightParen,
  kLeftCurly,
  kRightCurly,
  kLeftSquare,
  kRightSquare,
  kSemiColon,
  kColon,

  // Operators
  kAssign,
  kPlusSign,
  kStar,
  kDash,
  kForwardSlash,
  kLessThan,
  kLessThanEqual,
  kGreaterThan,
  kGreaterThanEqual,
  kEqualsEquals,
  kNotEquals,
  kAndOp,
  kOrOp,
  kNotOp,

  // Special terminal types
  kEndOfFile,
  kLexicalError
};

  typedef enum kTokenEnumType TokenType;



/*******************************************************************************
 * Class Definitions
 *
 * You will need to define a Token class (remember, a pointer of type Token *
 * is returned by the scan method of the scanner class.)
 * Also, Classes are typically declared (and sometimes also defined) in
 * their own header files
 *
 * You will also need to define a Scanner class with a scan and other methods
 ******************************************************************************/
/*! Creates an token node that stores a type and a lexeme.
 * Can be used to create a linked list of tokens
 */
class Token {
 public:
  Token() {terminal_ = kLexicalError, lexeme_ = " ", next_ = nullptr;}
  /*! The Token constructor requires three parameters:
   *	terminal, lexeme, and a pointer to the next token
   * \param lexeme The token's lexeme as a string
   * \param terminal The token's type as a TokenType object
   * \param next A pointer to the next Token object in the linked list 
   */ 
  Token(std::string lexeme, TokenType terminal, Token* next) {
    terminal_ = terminal, lexeme_ = lexeme, next_ = next;
  }
  Token(const char* lexeme, TokenType terminal, Token* next) {
    terminal_ = terminal, lexeme_ = std::string(lexeme), next_ = next;
  }

  TokenType get_terminal() {return terminal_;}
  std::string get_lexeme() {return lexeme_;}
  Token* get_next() {return next_;}

  void set_terminal(TokenType new_terminal) {terminal_ = new_terminal;}
  void set_lexeme(std::string new_lexeme) {lexeme_ = new_lexeme;}
  void set_next(Token *new_next) {next_ = new_next;}

 private:
  TokenType terminal_;
  std::string lexeme_;
  Token *next_;
};

/*! Scans an array of chars and converts it into a linked list of Token objects
 *  Example:
 *    Scanner scanner = new Scanner();
 *    Token token = scanner.Scan(*text)
 *    delete scanner;
 */
class Scanner {
 public:
  Scanner();

  /*! Takes in an array of characters and returns a linked list of Tokens
   *  \param text The character array to be scanned.
   */
  Token *Scan(const char *);
  regex_t *white_space = make_regex("^[\n\t\r ]+");
  regex_t *block_comment = make_regex("^/\\*([^\\*]|\\*+[^\\*/])*\\*+/");
  regex_t *line_comment = make_regex("^//[^\n]*\n");

 private:
  regex_t* regex_[kNotOp+1];
  /*! Takes a character array and removes the leading white space and comments
   *  \param white_space A regular expression to match all white space
   *  \param block_comment A regular expression to match block comments
   *  \param line_comment A regular expression to match line comments
   *  \param text The character array to remove the leading whitespace and 
   *  		comments from
   */
  int consume_whitespace_and_comments(regex_t *white_space,
                                    regex_t *block_comment,
                                    regex_t *line_comment,
                                    const char *text);
};
} /* namespace scanner */
} /* namespace fcal */

#endif  // PROJECT_INCLUDE_SCANNER_H_
