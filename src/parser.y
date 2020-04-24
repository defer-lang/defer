%{

#include <stdio.h>
#include <string.h>

#include "./src/sds.h"

extern int yylineno;
extern char* yytext;

extern int yylex(void);

void yyerror(const char* string);
int main();

%}

%union {
    sds string;
    int number;
}

%token PRINT TOKEN NEWLINE
%token <string> STRING
%token <number> NUMBER

%%

statements :
           |    statements statement NEWLINE
           ;

statement:      STRING
         |      NUMBER
         |      PRINT STRING {
                    printf("  | %s\n>>> ", $2);
                }
         |      PRINT NUMBER {
                    printf("  | %d\n>>> ", $2);
                }
         ;

%%

void yyerror(const char* string) {
    fprintf(stderr, "error: line %d:\n     : %s\n     : %s\n",
            yylineno, yytext, string);
}

int main() {
    printf(">>> ");
    yyparse();
    return 0;
}

