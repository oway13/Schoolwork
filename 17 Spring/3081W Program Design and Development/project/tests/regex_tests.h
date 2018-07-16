#include <cxxtest/TestSuite.h>
#include "include/regex.h"

using namespace std;
class RegexTestSuite : public CxxTest::TestSuite {
 public:
  // Tests for makeRegex and matchRegex
  // --------------------------------------------------
  /* These tests ensure that the makeRegex and matchRegex work as
     expected.  These tests are independent from the scanner or
     WordCount application.
   */

  void test_make_matchRegex_match(void) {
    regex_t *re = fcal::scanner::make_regex("^[0-9]+");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "123 ");
    TS_ASSERT(numMatchedChars == 3);
  }

  void test_make_matchRegex_no_match(void) {
    regex_t *re = fcal::scanner::make_regex("^[0-9]+");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, " 123 ");
    TS_ASSERT(numMatchedChars == 0);
  }

  void test_make_matchRegex_match_string_copy(void) {
    regex_t *re = fcal::scanner::make_regex("^[0-9]+");
    TS_ASSERT(re);
    const char *text = "123 ";
    int numMatchedChars = fcal::scanner::match_regex(re, text);
    TS_ASSERT(numMatchedChars == 3);
    std::string lex(text, numMatchedChars);
    TS_ASSERT_EQUALS(lex, "123");
  }

  void test_terminal_intKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^int");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "int ");
    TS_ASSERT(numMatchedChars == 3);
  }

  void test_terminal_floatKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^float");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "float ");
    TS_ASSERT(numMatchedChars == 5);
  }

  void test_terminal_boolKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^boolean");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "boolean ");
    TS_ASSERT(numMatchedChars == 7);
  }

  void test_terminal_trueKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^True");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "True ");
    TS_ASSERT(numMatchedChars == 4);
  }

  void test_terminal_falseKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^False");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "False ");
    TS_ASSERT(numMatchedChars == 5);
  }

  void test_terminal_stringKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^string");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "string ");
    TS_ASSERT(numMatchedChars == 6);
  }

  void test_terminal_matrixKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^matrix");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "matrix ");
    TS_ASSERT(numMatchedChars == 6);
  }

  void test_terminal_letKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^let");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "let ");
    TS_ASSERT(numMatchedChars == 3);
  }

  void test_terminal_inKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^in");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "in ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_endKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^end");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "end ");
    TS_ASSERT(numMatchedChars == 3);
  }

  void test_terminal_ifKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^if");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "if ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_thenKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^then");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "then ");
    TS_ASSERT(numMatchedChars == 4);
  }

  void test_terminal_elseKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^else");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "else ");
    TS_ASSERT(numMatchedChars == 4);
  }

  void test_terminal_repeatKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^repeat");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "repeat ");
    TS_ASSERT(numMatchedChars == 6);
  }

  void test_terminal_whileKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^while");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "while ");
    TS_ASSERT(numMatchedChars == 5);
  }

  void test_terminal_printKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^print");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "print ");
    TS_ASSERT(numMatchedChars == 5);
  }

  void test_terminal_toKwd(void) {
    regex_t *re = fcal::scanner::make_regex("^to");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "to ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_intConst(void) {
    regex_t *re = fcal::scanner::make_regex("^[0-9]+");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "123 ");
    TS_ASSERT(numMatchedChars == 3);
  }

  void test_terminal_floatConst(void) {
    regex_t *re = fcal::scanner::make_regex("^[0-9]*\\.[0-9]+");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "12.34 ");
    TS_ASSERT(numMatchedChars == 5);
  }

  void test_terminal_stringConst(void) {
    regex_t *re = fcal::scanner::make_regex("^\\\".+\\\"");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "\"Test String\"");
    TS_ASSERT(numMatchedChars == 13);
  }

  void test_terminal_variableName(void) {
    regex_t *re = fcal::scanner::make_regex("^_*[a-zA-z_][a-zA-Z0-9_]*");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "_TestVar13 ");
    TS_ASSERT(numMatchedChars == 10);
    numMatchedChars = fcal::scanner::match_regex(re, "13_TestVar31 ");
    TS_ASSERT(numMatchedChars == 0);
  }

  void test_terminal_leftParen(void) {
    regex_t *re = fcal::scanner::make_regex("^\\(");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "( ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_rightParen(void) {
    regex_t *re = fcal::scanner::make_regex("^\\)");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, ") ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_leftCurly(void) {
    regex_t *re = fcal::scanner::make_regex("^\\{");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "{ ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_rightCurly(void) {
    regex_t *re = fcal::scanner::make_regex("^\\}");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "} ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_leftSquare(void) {
    regex_t *re = fcal::scanner::make_regex("^\\[");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "[ ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_rightSquare(void) {
    regex_t *re = fcal::scanner::make_regex("^\\]");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "] ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_semicolon(void) {
    regex_t *re = fcal::scanner::make_regex("^;");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "; ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_colon(void) {
    regex_t *re = fcal::scanner::make_regex("^:");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, ": ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_assign(void) {
    regex_t *re = fcal::scanner::make_regex("^=");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "= ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_plusSign(void) {
    regex_t *re = fcal::scanner::make_regex("^\\+");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "+ ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_star(void) {
    regex_t *re = fcal::scanner::make_regex("^\\*");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "* ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_dash(void) {
    regex_t *re = fcal::scanner::make_regex("^-");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "- ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_forwardSlash(void) {
    regex_t *re = fcal::scanner::make_regex("^/");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "/ ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_lessThan(void) {
    regex_t *re = fcal::scanner::make_regex("^<");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "< ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_lessThanEqual(void) {
    regex_t *re = fcal::scanner::make_regex("^(<=|=<)");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "<= ");
    TS_ASSERT(numMatchedChars == 2);
    numMatchedChars = fcal::scanner::match_regex(re, "=< ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_greaterThan(void) {
    regex_t *re = fcal::scanner::make_regex("^>");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "> ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_terminal_greaterThanEqual(void) {
    regex_t *re = fcal::scanner::make_regex("^(>=|=>)");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, ">= ");
    TS_ASSERT(numMatchedChars == 2);
    numMatchedChars = fcal::scanner::match_regex(re, "=> ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_equalsEquals(void) {
    regex_t *re = fcal::scanner::make_regex("^==");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "== ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_notEquals(void) {
    regex_t *re = fcal::scanner::make_regex("^!=");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "!= ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_andOp(void) {
    regex_t *re = fcal::scanner::make_regex("^&&");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "&& ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_orOp(void) {
    regex_t *re = fcal::scanner::make_regex("^\\|\\|");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "|| ");
    TS_ASSERT(numMatchedChars == 2);
  }

  void test_terminal_notOp(void) {
    regex_t *re = fcal::scanner::make_regex("^!");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "! ");
    TS_ASSERT(numMatchedChars == 1);
  }

  void test_white_space(void) {
    regex_t *re = fcal::scanner::make_regex("^[\n\t\r ]+");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "	\n ");
    TS_ASSERT(numMatchedChars == 3);
  }

  void test_block_comment(void) {
    regex_t *re = fcal::scanner::make_regex("^/\\*([^\\*]|\\*+[^\\*/])*\\*+/");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "/* Block Comment */ ");
    TS_ASSERT(numMatchedChars == 19);
  }
  void test_line_comment(void) {
    regex_t *re = fcal::scanner::make_regex("^//[^\n]*\n");
    TS_ASSERT(re);
    int numMatchedChars = fcal::scanner::match_regex(re, "// line comment\n");
    TS_ASSERT(numMatchedChars == 16);
  }

};
