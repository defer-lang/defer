# ---[ the main part ]---------------------------------------------------------
main: lex.yy.o y.tab.o
	gcc lex.yy.o y.tab.o -o defer

# ---[ the lexer part ]--------------------------------------------------------
lex.yy.o: lex.yy.c y.tab.h
	gcc -c lex.yy.c

lex.yy.c: ./src/parser.l
	lex ./src/parser.l

# ---[ the yacc part ]---------------------------------------------------------
y.tab.o: y.tab.c
	gcc -c y.tab.c

y.tab.h:
y.tab.c:
	yacc -d ./src/parser.y

# ---[ the action part ]-------------------------------------------------------
.PHONY: clean
clean:
	rm lex.yy.c lex.yy.o y.tab.c y.tab.h y.tab.o defer
