
/**************************
 * bignum_math.c -- an outline for CLab1
 *
 * orginially written by Andy Exley
 * modified by Emery Mizero
 **************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bignum_math.h"


/*
 * Returns true if the given char is a digit from 0 to 9
 */
bool is_digit(char c) {
	return c >= '0' && c <= '9';
}

/*
 * Returns true if lower alphabetic character
 */
bool is_lower_alphabetic(char c) {
	return c >= 'a' && c <= 'z';
}

/*
 * Returns true if upper alphabetic character
 */
bool is_upper_alphabetic(char c) {
	return c >= 'A' && c <= 'Z';
}

/*
 * Convert a string to an integer
 * returns 0 if it cannot be converted.
 */
int string_to_integer(char* input) {
	int result = 0;
	int length = strlen(input);
    int num_digits = length;
	int sign = 1;
	
	int i = 0;
    int factor = 1;

    if (input[0] == '-') {
		num_digits--;
		sign = -1;
    }

	for (i = 0; i < num_digits; i++, length--) {
		if (!is_digit(input[length-1])) {
			return 0;
		}
		if (i > 0) factor*=10;
		result += (input[length-1] - '0') * factor;
	}

    return sign * result;
}

/*
 * Returns true if the given base is valid.
 * that is: integers between 2 and 36
 */
bool valid_base(int base) {
	if(!(base >= 2 && base <= 36)) { 
		return false; 
	}
	return true;
}

/*
 * converts from an array of characters (string) to an array of integers
 */
int* string_to_integer_array(char* str) {
	int* result;
	int i, str_offset = 0;
		result = malloc((strlen(str) + 1) * sizeof(int));
		result[strlen(str)] = -3;
	for(i = str_offset; str[i] != '\0'; i++) {
		if(is_digit(str[i])) { 
			result[i - str_offset] = str[i] - '0';
		} else if (is_lower_alphabetic(str[i])) {
			result[i - str_offset] = str[i] - 'a' + 10;
		} else if (is_upper_alphabetic(str[i])) {
			result[i - str_offset] = str[i] - 'A' + 10;
		} else {
			printf("I don't know how got to this point!\n");
		}
	}
	return result;
}

/*
 * finds the length of a bignum... 
 * simply traverses the bignum until a negative number is found.
 */
int bignum_length(int* num) {
	int len = 0;
	while(num[len] >= 0) { len++; }
	return len;
}


/*
 * TODO
 * Returns true if the given string (char array) is a valid input,
 * that is: digits 0-9, letters A-Z, a-z
 * and it should not violate the given base and should not handle negative numbers
 */
bool valid_input(char* input, int base) {
	int i = 0;
	if (input[0] == 45){ 
		return false; //If the first character is a negative sign, false
	}
	while(i < bignum_length(string_to_integer_array(input))){
		if(!is_digit(input[i]) && !is_lower_alphabetic(input[i]) && !is_upper_alphabetic(input[i])){
			return false; //If it isn't a digit or an alphabetic, false
		} else if(is_digit(input[i]) && (input[i] - '0')  >= base){
			return false; //If it is a digit and greater than the base, false
		} else if (is_lower_alphabetic(input[i]) && (input[i] - 'a' + 10) >= base) {
			return false; //If it is a lower alphabetic that represents a number greater than the base, false
		} else if (is_upper_alphabetic(input[i]) && (input[i] - 'A' + 10) >= base){
			return false; //If it is an upper alphabetic that represents a number greater than the base, false
		} else{
		i++; //If it isn't any of the above, check the next digit
		}
	}
	return true; //returns true if the entire array doesn't fail above
}



/*
 * TODO
 * Prints out a bignum using digits and lower-case characters
 * Current behavior: prints integers
 * Expected behavior: prints characters
 */
void bignum_print(int* num) {
	char trans[36] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d',
			'e','f','g','h','i','j','k','l','m','n','o','p','q','r',
			's','t','u','v','w','x','y','z'}; //All of the print chars I'm going to use put into an array at the index of the value they represent
	if(num == NULL) { return; }
	/* Handle negative numbers as you want */
	/* Then, print each digit */
	int i;
	bool lead = false;
	for(i = 0; num[i] > -3; i++) {
		if(num[i] == -2){
			;
		} else if(num[i] == -1){
			printf("%c", '-');
		} else if(num[i] != 0){
			printf("%c", trans[num[i]]);
			lead = true;
		} else if(num[i] == 0 && (lead == true || num[i+1] == -3)){
			printf("%c", '0');
		}  
	}
	printf("\n");
}

/*
 *	Helper for reversing the result that we built backward.
 *  see add(...) below
 */
void reverse(int* num) {
	int i, len = bignum_length(num);
	for(i = 0; i < len/2; i++) {
		int temp = num[i];
		num[i] = num[len-i-1];
		num[len-i-1] = temp;
	}
}


/*
 * used to add two numbers with the same sign
 * GIVEN FOR GUIDANCE
 */
int* add(int* input1, int* input2, int base) {
	int len1 = bignum_length(input1);
	int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 2;
	int* result = (int*) malloc (sizeof(int) * resultlength);
	int r = 0;
	int carry = 0;
	int sign = input1[len1];
    int num1, num2;

	len1--;
	len2--;

	while (len1 >= 0 || len2 >= 0) {
        if (len1 >= 0) {
            num1 = input1[len1];
        } else {
            num1 = 0;
        }

        if (len2 >= 0) {
            num2 = input2[len2];
        } else {
            num2 = 0;
        }
		result[r] = (num1 + num2 + carry) % base;
		carry = (num1 + num2 + carry) / base;
		len1--;
		len2--;
		r++;
	}
	if (carry > 0) {
        result[r] = carry; 
        r++; 
    }
	result[r] = sign;
	reverse(result);
	return result;
}

int* subtract(int* input1, int* input2, int base){
	int len1 = bignum_length(input1);
	int len2 = bignum_length(input2);
	int lng = ((len1 > len2)? len1 : len2);
	int srt = ((len1 < len2)? len1 : len2);
	int resultlength = lng+3;
	int* result = (int*) malloc (sizeof(int) * (resultlength));
	int i;
	int sign = -2;
	int track = 1;
	int len1dif = len1 - srt;
	int len2dif = len2 - srt;
	int in1;
	int in2;

	for(i = 0; i < srt ; i++){  //From 0 to the length of the shorter number
		in1 = srt + len1dif - i-2; //These should make it so they work on the same digit even when different lengths
		in2 = srt + len2dif -i-2;
		if(input1[in1] < input2[in2] && i != len1-1){ //If the first is less than second it isn't the high order digit
				input1[in1-1]--;	//Take 1 from the next digit up
				input1[in1] = input1[in1] + base; //Add "10" to make up for the taking away above
			//	printf("track: %d, r: %d", track, input1[in1]-input2[in2]); debug
				result[track] = input1[in1] - input2[in2]; //Subtract and put in place
			} else if(input1[in1] < input2[in2] && i == len1 - 1){ //If the first is less than second and it is the highest order digit
				sign = -1;  //Keep track of the negative sign
				 //Do the subtraction
				result[track] = input2[in2]-input1[in1]; //Make the number not negative and put in place
			} else {
				result[track] = input1[in1] - input2[in2]; //When the first is greater than or equal to the second
			}	//The subtraction should work, and put in place
			track++; 
		}
		if(len1 < len2){ //If the first number is longer than the second
			for(i = len2dif-1; i >= 0; i--){ //Go through the unprocessed digits
				result[track] = input2[i]; //Put them in place
				track++;
			} 
		} else if(len2 < len1){ //When the second number is long than the first
			for(i = len1dif-1; i>= 0; i--){
				result[track] = input1[i];
				track++;
			} //If they are the same length there should be nothing else to put in place
		}


	result[0] = sign; //Add the sign to the end
	result[track] = -3; //Add the terminator to the front
	reverse(result); //Reverse the number
	return result;
}

/*
 * TODO
 * This function is where you will write the code that performs the heavy lifting, 
 * actually performing the calculations on input1 and input2.
 * Return your result as an array of integers.
 * HINT: For better code structure, use helper functions.
 */
int* perform_math(int* input1, int* input2, char op, int base) {
	/* 
	 * this code initializes result to be large enough to hold all necessary digits.
	 * if you don't use all of its digits, just put a -1 at the end of the number.
	 * you may omit this result array and create your own.
     */

    int len1 = bignum_length(input1);
    int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 1;
	int* result = (int*) malloc (sizeof(int) * resultlength);
 
	if(op == '+') {
		return add(input1, input2, base);
	} else if (op == '-') {
		return subtract(input1, input2, base);
	} else {return result; }
}

/*
 * Print to "stderr" and exit program
 */
void print_usage(char* name) {
	fprintf(stderr, "----------------------------------------------------\n");
	fprintf(stderr, "Usage: %s base input1 operation input2\n", name);
	fprintf(stderr, "base must be number between 2 and 36, inclusive\n");
	fprintf(stderr, "input1 and input2 are arbitrary-length integers\n");
	fprintf(stderr, "Two operations are allowed '+' and '-'\n");
	fprintf(stderr, "----------------------------------------------------\n");
	exit(1);
}


/*
 * MAIN: Run the program and tests your functions.
 * sample command: ./bignum 4 12 + 13
 * Result: 31
 */
int main(int argc, char** argv) {

	int input_base;

    int* input1;
    int* input2;
    int* result;

	if(argc != 5) { 
		print_usage(argv[0]); 
	}

	input_base = string_to_integer(argv[1]);

	if(!valid_base(input_base)) { 
		fprintf(stderr, "Invalid base: %s\n", argv[1]);
		print_usage(argv[0]);
	}
	

	if(!valid_input(argv[2], input_base)) { 
		fprintf(stderr, "Invalid input1: %s\n", argv[2]);
		print_usage(argv[0]);
	}

	if(!valid_input(argv[4], input_base)) { 
		fprintf(stderr, "Invalid input2: %s\n", argv[4]);
		print_usage(argv[0]);
	}

	if(argv[3][0] != '-' && argv[3][0] != '+') {
		fprintf(stderr, "Invalid operation: %s\n", argv[3]);
		print_usage(argv[0]);
	}

	input1 = string_to_integer_array(argv[2]);
    input2 = string_to_integer_array(argv[4]);

    result = perform_math(input1, input2, argv[3][0], input_base);

    printf("Result: ");
    bignum_print(result);
	printf("\n");

	exit(0);
}
