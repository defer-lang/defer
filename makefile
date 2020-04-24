# ---[ the main part ]---------------------------------------------------------
main: LEXER YACCER SDS_STRING
	gcc lex.yy.o y.tab.o sds.o -o defer

# ---[ the lexer part ]--------------------------------------------------------
.PHONY: LEXER
LEXER: lex.yy.o lex.yy.c

lex.yy.o: lex.yy.c y.tab.h
	gcc -c lex.yy.c

lex.yy.c: ./src/parser.l
	lex ./src/parser.l

# ---[ the yacc part ]---------------------------------------------------------
.PHONY: YACCER
YACCER: y.tab.o y.tab.h y.tab.c SDS_STRING

y.tab.o: y.tab.c
	gcc -c y.tab.c

y.tab.h y.tab.c:
	yacc -d ./src/parser.y

# ---[ the sds part ]----------------------------------------------------------
.PHONY: SDS_STRING
SDS_STRING: sds.o

sds.o:
	gcc -c ./src/sds.c

# ---[ the action part ]-------------------------------------------------------
.PHONY: clean
clean:
	rm lex.yy.c lex.yy.o y.tab.c y.tab.h y.tab.o defer
