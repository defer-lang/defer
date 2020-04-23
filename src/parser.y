%{

#include <stdio.h>
#include <string.h>

int yylex(void);
void yyerror(const char* str);
int main();

%}

%token STRING NUMBER PRINT TOKEN

%%

statement:      STRING
         |      NUMBER
         |      PRINT STRING
         |      PRINT NUMBER
         ;

%%

void yyerror(const char* str) {
    fprintf(stderr, "error: %s\n", str);
}

int main() {
    printf("hello wolrd");
    return 0;
}

