#Notes from my C study
#Book: The C programming Language

#Terminology:


#Concepts:
#Chapter 1
##Data types

###int
    int holds 16 bits (a max value of 32767)
    printf synyax: %d (print as decimal integer)
    or %6d (print as decimal integer 6 characters wide)

###long
    long holds 32 bits
    printf syntax: %ld

###float
    float holds ??? bits
    printf syntax: %f (print as floating point)
    or %6f (print as floating point, 6 characters wide)
    or %.2f (2 characters after decimal point)
    or %6.2f (6 characters wide and 2 after decimal point)


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






