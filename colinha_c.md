#Notes from my C study
#Book: The C programming Language

#Terminology:


#Concepts:
#Chapter 1

##Top line imports and constant definitions
At the top of each C program you can import libraries 
and define constants. Constants are defined in UPPERCASE.

For example:


    #include <stdio.h>
    #define LOWER 0     /* lower limit*/
    #define UPPER 300   /* upper limit*/
    #define STEP 20     /* step size  */

    main(){
        ...
    }


#Features of <stdio.h>
##Character input and output
Every time getchar() is called you get the next input character
from a text stream.

Every time putchar(c) is called you print that character.

For example:
    c = getchar();
    putchar(c);

##Input and output management
The standard input and output library has several useful functions
and definitions.

One such is the EOF (end of file) definition.

This allows you to read an input stream and know uniquevocally when
the input ends.

Example of a program:

    #include <stdio.h>

    main(){
        int c;
        c = getchar();
        while (c != EOF) {
            putchar(c);
            c = getchar();
        }
    }


##Multiple attributions
Variable attribution works from right to left, so you can do this
to set multiple variables to the same value:

    a = b = c = 0

##Example of word counting program

    #include <stdio.h>

    #define IN 1 /* inside a word */
    #define OUT 0 /* outside a word */

    /* count lines, words, and characters in input */
    main() {
        int c, nl, nw, nc, state;
        state = out;
        nl = nw = nc = 0;
        while ((c = getchar()) != EOF) {
            ++nc;
            if (c == '\n')
                ++nl;
            if (c == ' ' || c == '\n' || c = '\t')
                state = OUT;
            else if (state == OUT) {
                state = IN;
                ++nw;
            }
        }
        printf("%d %d %d\n", nl, nw, nc);
    }

##Arrays
Arrays are declared using bracket syntax:

    int ndigit[10];

This initializes a vector with integers and index from 0 through 9.

##Functions
Functions are defined outside of the main block and
can appear in any order (even after the main block iself)

Example:

    #include <stdio.h>

    int my_function(int m, int n);

    main(){
        ...
    }

    int my_function(int base, int n){
        int p;
        ...
        return p;
    }

The statement right before the main block is called a 
**function prototype** and is required to agree with the
function declaration further below (same function arguments
and data types).

##Returns of the Main function
The main function can also return values.

By convention if Main returns 0 then everything worked correctly.
If return is != 0 something went wrong.

#Chapter 2 - Types, Operators and Expressions
##Data types

###char
    char holds a single byte, and can hold one character

###int
    int holds 16 bits (a max value of 32767)
    printf synyax: %d (print as decimal integer)
    or %6d (print as decimal integer 6 characters wide)
    
    int can have two qualifiers: short and long:
    short
        short holds usually 16 bits
        Example:
            short int sh;

    long
        long holds 32 bits
        printf syntax: %ld
        Example:
            long int counter;

###float
    single-precision floating point
    float holds ??? bits
    printf syntax: %f (print as floating point)
    or %6f (print as floating point, 6 characters wide)
    or %.2f (2 characters after decimal point)
    or %6.2f (6 characters wide and 2 after decimal point)

###double
    double-precision floating point


##Escape sequences
Those are special characters that represent something else:

\a      alert (bell) character
\b      backspace
\f      formfeed
\n      newline
\r      carriage return
\t      horizontal tab
\v      vertical tab
\\      backslash
\?      question mark
\'      single quote
\"      double quote
\ooo    octal number
\xhh    hexadecimal number

##Enumerations
You can define enumerations to have several constants.
(see page 49 if you need to use enumerations)

##Declarations
Ways to declare variables:

Compact way:
    int lower, upper, step;
    char c, line[1000];

Longer way:
    int lower;
    int upper;
    int step;
    char c;
    char line[1000];

You can declare and initialize at the same time:
    char esc = '\\';
    int i = 0;
    int limit = MAXLINE+1;
    float eps = 1.0e-5;

Constants can also be set if you don't expect the value to change:

const double e = 2.71;
const char msg[] = "warning: ";
int strlen(const char[]);

##Arithmetic operators
(highest precedence, if on the same row have equal precedence)
*, /, %
+, -

##Relational and Logical operators
(highest precedence, if on the same row have equal precedence)
(relational operators are lower in precedence than arithmetic operators)
>, >=, <, <=
==, !=
&&
||

##Increment and Decrement operators
i++ or ++i
i-- or --i
are all valid:
i++ (use the result and then perform increment)
++i (perform increment and then use result)

##Type Conversions
In general , the only automatic conversions are those that convert
a "narrower" operand into a "wider" one without losing information.
Be careful and refer to that chapter if you need to perform conversions.

##Bitwise Operators
&       bitwise AND
|       bitwise inclusive OR
^       bitwise exclusive OR
<<      left shift
>>      right shift
~       one' complement (unary)


#Chapter 3 - Control Flow
##Statements and Blocks
In C a statement is a piece of code ended by a semicolon (;)

Those are all statements:
    x = 0;
    i++;
    printf(...);

Blocks are segments of code within Braces "{" and "}"
There is no semicolon after the right brace that ends a block.

*In C the indentation is ignored by the compiler!!!*

So for example, the else is associated with the closest if 
without an else:

    if (n > 0)
        if (a > b)
            z = a;
        else
            z = b;

But if you wish to associate the else with the first if
you need to add brackets (the identation is not enough):

    if (n > 0){
        if (a > b)
            z = a;
    }
    else
        z = b;

When there are nested IFs it is a good idea to use brackets

##Else-if
The else-if construction goes like:

    if (expression)
        statement
    else if (expression)
        statement
    else if (expression)
        statement
    else
        statement

##Switch
See the book for a detailed discussion on switch statements.

##While and For

    while (expression)
        statement

    for (expr1; expr2; expr3)
        statement

##Do-while
    
    do
        statement
    while (expression);

#Break and Continue
*Break* can be used to exit in the middle of a loop (as opposed to
at the top or botom). Break works with 'for', 'while', 'do' and 'switch'.

*Continue* is less used. It causes the next iteration of the loop
to instantly begin.

#Chapter 4 - Functions and Program Structure








