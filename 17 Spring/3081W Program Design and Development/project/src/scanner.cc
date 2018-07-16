/*******************************************************************************
 * Name             : scanner.cc
 * Project          : fcal
 * Module           : scanner
 * Description      : Implemenation of the Scanner class
 * Creation Date    : 2/24/17
 * Copyright        : 2017 CSCI3081W Staff. All rights reserved
 * Original Authors : Wyatt Kormick, Andrew Johnson
 ******************************************************************************/

/*******************************************************************************
 * Includes
 ******************************************************************************/
  #include <string>
  #include "include/scanner.h"



/*******************************************************************************
 * Constructors/Destructor
 ******************************************************************************/

/*******************************************************************************
 * Functions
 ******************************************************************************/
namespace fcal {
namespace scanner {

  Scanner::Scanner() {
    /* Regular Expression Creation */
    /* keywords */
    regex_[kIntKwd] = make_regex("^int");
    regex_[kFloatKwd] = make_regex("^float");
    regex_[kBoolKwd] = make_regex("^boolean");
    regex_[kTrueKwd] = make_regex("^True");
    regex_[kFalseKwd] = make_regex("^False");
    regex_[kStringKwd] = make_regex("^string");
    regex_[kMatrixKwd] = make_regex("^matrix");
    regex_[kLetKwd] = make_regex("^let");
    regex_[kInKwd] = make_regex("^in");
    regex_[kEndKwd] = make_regex("^end");
    regex_[kIfKwd] = make_regex("^if");
    regex_[kThenKwd] = make_regex("^then");
    regex_[kElseKwd] = make_regex("^else");
    regex_[kRepeatKwd] = make_regex("^repeat");
    regex_[kWhileKwd] = make_regex("^while");
    regex_[kPrintKwd] = make_regex("^print");
    regex_[kToKwd] = make_regex("^to");
    /* constants */
  \
                regex_[kIntConst] = make_regex("^[0-9]+");
    regex_[kFloatConst] = make_regex("^[0-9]*\\.[0-9]+");
    regex_[kStringConst] = make_regex("^\"[^\"]+\"");
    /* names */
    regex_[kVariableName] = make_regex("^_*[a-zA-Z_][a-zA-Z0-9_]*");
    /* punctuation */
    regex_[kLeftParen] = make_regex("^\\(");
    regex_[kRightParen] = make_regex("^\\)");
    regex_[kLeftCurly] = make_regex("^\\{");
    regex_[kRightCurly] = make_regex("^\\}");
    regex_[kLeftSquare] = make_regex("^\\[");
    regex_[kRightSquare] = make_regex("^\\]");\
    regex_[kSemiColon] = make_regex("^;");
    regex_[kColon] = make_regex("^:");
    /* operators */
    regex_[kAssign] = make_regex("^=");
    regex_[kPlusSign] = make_regex("^\\+");
    regex_[kStar] = make_regex("^\\*");
    regex_[kDash] = make_regex("^-");
    regex_[kForwardSlash] = make_regex("^/");
    regex_[kLessThan] = make_regex("^<");
    regex_[kLessThanEqual] = make_regex("^(<=|=<)");
    regex_[kGreaterThan] = make_regex("^>");
    regex_[kGreaterThanEqual] = make_regex("^(>=|=>)");
    regex_[kEqualsEquals] = make_regex("^==");
    regex_[kNotEquals] = make_regex("^!=");
    regex_[kAndOp] = make_regex("^&&");
    regex_[kOrOp] = make_regex("^\\|\\|");
    regex_[kNotOp] = make_regex("^!");
    }

  fcal::scanner::Token *fcal::scanner::Scanner::Scan(const char *text) {
    if (text == nullptr) {
      exit(1);
    }
    int num_matched_chars = 0;
    int max_num_matched_chars = 0;
    Token *token = new Token();
    Token *first_token = token;


    /* Removes Leading Whitespace and Comments */
    num_matched_chars = consume_whitespace_and_comments(white_space,           \
                                             block_comment, line_comment, text);
    text = text + num_matched_chars;

    while (text[0] != '\0') {
      max_num_matched_chars = 0;
      /* Tests against all token types iteratively, in priority order */
      for (unsigned int i = kIntKwd; i <= kNotOp;  i++) {
        num_matched_chars = match_regex(regex_[i], text);
        if (num_matched_chars > max_num_matched_chars) {
          max_num_matched_chars = num_matched_chars;
          token->set_terminal(TokenType(i));
          token->set_lexeme(std::string(text, 0, num_matched_chars));
         }
      }  /* for */
      if (token->get_terminal() == kLexicalError) {
        token->set_lexeme(std::string(text, 0, 1));
        max_num_matched_chars = 1;
      }

      text = text + max_num_matched_chars;
      Token *next_token = new Token();
      token->set_next(next_token);
      token = next_token;

      /* Removes new leading whitespace and comments */
      num_matched_chars = consume_whitespace_and_comments(white_space,         \
                                             block_comment, line_comment, text);
      text = text + num_matched_chars;
    }  /* while */
    token->set_terminal(kEndOfFile);
    token->set_lexeme("");

    return first_token;
  }  /* Scan() */


  int fcal::scanner::Scanner::consume_whitespace_and_comments                  \
                                (regex_t *white_space, regex_t *block_comment, \
                                 regex_t *line_comment, const char *text) {
    int num_matched_chars = 0;
    int total_num_matched_chars = 0;
    int still_consuming_white_space;

    do {
      still_consuming_white_space = 0;  // exit loop if not reset by a match

      // Try to match white space
      num_matched_chars = match_regex(white_space, text);
      total_num_matched_chars += num_matched_chars;
      if (num_matched_chars > 0) {
        text = text + num_matched_chars;
        still_consuming_white_space = 1;
      }

      // Try to match block comments
      num_matched_chars = match_regex(block_comment, text);
      total_num_matched_chars += num_matched_chars;
      if (num_matched_chars > 0) {
        text = text + num_matched_chars;
        still_consuming_white_space = 1;
      }
      // Try to match line comments
      num_matched_chars = match_regex(line_comment, text);
      total_num_matched_chars += num_matched_chars;
      if (num_matched_chars > 0) {
        text = text + num_matched_chars;
        still_consuming_white_space = 1;
      }
    } while (still_consuming_white_space);

    return total_num_matched_chars;
}  /* consume_whitespace_and_comments() */
}  // namespace scanner
}  // namespace fcal
