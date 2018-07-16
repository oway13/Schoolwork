#Note, you may have to update CXX_DIR and
#CXXTEXT to point the right locations and executables
#to get it to work - look at your Lab 3 Makefile
CXX_DIR = ./lib/cxxtest
CXXTEST = $(CXX_DIR)/bin/cxxtestgen
CXXFLAGS = --error-printer --abort-on-fail --have-eh

FLAGS = -Wall -I. -std=gnu++11

# Program files.
read_input.o:	src/read_input.cc include/read_input.h
	g++ $(FLAGS) -c src/read_input.cc

regex.o:	src/regex.cc include/regex.h
	g++ $(FLAGS) -c src/regex.cc

parser.o: include/parser.h src/parser.cc include/ext_token.h include/parse_result.h
	g++ $(FLAGS) -c src/parser.cc

scanner.o: include/scanner.h src/scanner.cc
	g++ $(FLAGS) -c src/scanner.cc

ext_token.o: include/ext_token.h src/ext_token.cc include/parser.h include/scanner.h
	g++ $(FLAGS) -c src/ext_token.cc

Matrix.o: include/Matrix.h src/Matrix.cc
	g++ $(FLAGS) -c src/Matrix.cc



# Testing files and targets.
run-tests:	regex_tests scanner_tests parser_tests ast_tests codegeneration_tests
	./regex_tests
	./scanner_tests
	./parser_tests
	./ast_tests
	./codegeneration_tests

#Tests
regex_tests:	regex_tests.cc regex.o
	g++ $(FLAGS) -I$(CXX_DIR) -I. -o regex_tests regex.o regex_tests.cc

regex_tests.cc:	include/regex.h tests/regex_tests.h
	$(CXXTEST) $(CXXFLAGS) -o regex_tests.cc tests/regex_tests.h

scanner_tests:	scanner_tests.cc scanner.o regex.o read_input.o
	g++ $(FLAGS) -I$(CXX_DIR) -I. -o scanner_tests \
		scanner.o regex.o read_input.o scanner_tests.cc

scanner_tests.cc:	scanner.o tests/scanner_tests.h include/read_input.h
	$(CXXTEST) $(CXXFLAGS) -o scanner_tests.cc tests/scanner_tests.h

parser_tests:	parser_tests.cc parser.o read_input.o scanner.o regex.o src/ext_token.cc
	g++ $(FLAGS) -I$(CXX_DIR) -I. -o parser_tests \
	    parser.o parser_tests.cc scanner.o regex.o read_input.o src/ext_token.cc

parser_tests.cc: include/parser.h tests/parser_tests.h include/ext_token.h
	$(CXXTEST) $(CXXFLAGS) -o parser_tests.cc tests/parser_tests.h

ast_tests: ast_tests.cc read_input.o scanner.o parser.o regex.o ext_token.o
	g++ $(FLAGS) -I$(CXX_DIR) -I. -o ast_tests \
	 read_input.o scanner.o parser.o regex.o ext_token.o ast_tests.cc

ast_tests.cc: include/ast.h tests/ast_tests.h include/parser.h include/read_input.h include/scanner.h
	$(CXXTEST) $(CXXFLAGS) -o ast_tests.cc tests/ast_tests.h

codegeneration_tests: codegeneration_tests.cc parser.o Matrix.o scanner.o read_input.o ext_token.o regex.o
	g++ $(FLAGS) -I$(CXX_DIR) -I. -o codegeneration_tests \
	 parser.o Matrix.o scanner.o read_input.o ext_token.o regex.o codegeneration_tests.cc

codegeneration_tests.cc: include/ast.h include/parser.h include/Matrix.h include/scanner.h include/read_input.h include/ext_token.h include/regex.h
	$(CXXTEST) $(CXXFLAGS) -o codegeneration_tests.cc tests/codegeneration_tests.h

clean:
	rm -Rf *.o samples/*.dslup1 samples/*.dslup2 samples/*.dslup3 samples/*.output\
		samples/*.diff regex_tests regex_tests.cc \
		scanner_tests scanner_tests.cc \
		parser_tests parser_tests.cc \
		ast_tests ast_tests.cc \
		codegeneration_tests codegeneration_tests.cc \
		samples/forest_loss_v2.cc samples/my_code_1.cc \
		samples/my_code_2.cc samples/sample_1.cc \
		samples/sample_2.cc samples/sample_3.cc samples/sample_7.cc \
		samples/sample_8.cc samples/forest_loss_v2 samples/my_code_1 \
		samples/my_code_2 samples/sample_1 samples/sample_2 \
		samples/sample_3 samples/sample_7 samples/sample_8
