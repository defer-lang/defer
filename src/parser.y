%{

#include <stdio.h>
#include <string.h>

extern int yylineno;
extern char* yytext;

extern int yylex(void);

void yyerror(const char* string);
int main();

%}

%token STRING NUMBER PRINT TOKEN

%%

statements :
           |    statements statement
           ;

statement:      STRING
         |      NUMBER
         |      PRINT STRING
         |      PRINT NUMBER
         ;

%%

void yyerror(const char* string) {
    fprintf(stderr, "error: line %d:\n     : %s\n     : %s\n",
            yylineno, yytext, string);
}

int main() {
    yyparse();
    return 0;
}

