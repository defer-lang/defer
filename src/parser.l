%{

#include <stdio.h>
#include <stdlib.h>

#include "./src/sds.h"
#include "y.tab.h"

int yywrap(void);
void yyerror(const char* string);

sds parse_string(sds string);

%}

%%

(print) {
    // build-in function print
    return PRINT;
}

(\"[^\"]*\"|'[^']*') {
    // string: e.g. "peter" or 'this'
    // [TODO]: cannot support for esecpe
    // [WARRING]: remember to free this pointer
    yylval.string = sdsnew(yytext);
    parse_string(yylval.string);
    return STRING;
}

([_A-Za-z][_A-Za-z0-9]*) {
    // token
    return TOKEN;
}

([1-9][0-9]+|[0-9]) {
    // number
    // [TODO]: how about float?
    yylval.number = atoi(yytext);
    return NUMBER;
}

([ \f\r\t\v]+) {
    // blank character
    // do nothing when match blank character
}

(\n) {
    // newline, the end of one line
    return NEWLINE;
}

. {
    // error! can not match anything
    yyerror("invaild syntax");
}

%%

int yywrap(void) {
    return 1;
}

sds parse_string(sds string) {
    sdsrange(string, 1, -2);
}
