%{

#include <stdio.h>
#include "y.tab.h"

int yywrap(void);
int yyerror(const char* string);

%}

%%

(print) {
    return PRINT;
}

(\"[^\"]*\"|'[^']*') {
    return STRING;
}

([_A-Za-z][_A-Za-z0-9]*) {
    return TOKEN;
}

([1-9][0-9]+|[0-9]) {
    return NUMBER;
}

([ \f\r\t\v]+) {
    // do nothing when match blank character
}

. {
    yyerror("invaild syntax");
}

%%

int yywrap(void) {
    return 1;
}
