%{

#include <stdio.h>
#include "y.tab.h"

int yywrap(void);

%}

%%

(print) {
    printf("PRINT ");
    return PRINT;
}

(\"[^\"]*\"|'[^']*') {
    printf("STRING ");
    return STRING;
}

([_A-Za-z][_A-Za-z0-9]*) {
    printf("TOKEN ");
    return TOKEN;
}

([1-9][0-9]+|[0-9]) {
    printf("NUMBER ");
    return NUMBER;
}

([ \f\r\t\v]+) {
    // do nothing when match blank character
}

%%

int yywrap(void) {
    return 1;
}
