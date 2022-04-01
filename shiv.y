%{
    #include<stdio.h>    
    extern FILE* yyin;

    extern void yyerror(char*);
    extern int yylex();
%}

%token CLASS ABSTRACT EXTENDS IMPLEMENTS ID PUBLIC DELIM NUM ASSIGN MUL DIV SUB ADD
%token INT FLOAT CHAR STRING RETURN VOID MAIN STATIC FINAL SEP OP_BR CL_BR OP CL OP_S CL_S

%%
program : specifier CLASS ID inherit OP_BR body CL_BR  {printf("SYntactically correct\n"); return 0;}
        ;

specifier : 
            | ABSTRACT
            | FINAL
            | PUBLIC
         ;

inherit :
        | EXTENDS ID
        | IMPLEMENTS ID 
        | EXTENDS ID SEP IMPLEMENTS ID
        ;

body : main
     | function
     ;

function : dataType ID OP param CL OP_BR fnBody CL_BR
         ;


main : PUBLIC STATIC VOID MAIN OP STRING OP_S CL_S ID CL OP_BR fnBody CL_BR 
     ;

dataType : INT | FLOAT | CHAR | STRING | VOID
         ;

param : | dataType ID SEP param
        | dataType ID
      ;

fnBody :  statement DELIM return
        | statement DELIM fnBody
        ;


return : |
         RETURN ID DELIM
         ;

statement : dataType ID ASSIGN value
            | dataType ID ASSIGN expr
            ;

expr : value op value
      | value op expr
      ;

op : ADD | MUL | DIV | SUB
    ;

value : ID | NUM
      ;
        

%%

void yyerror(char* e) {
    printf("%s", e);
}

int main() {
    yyin = fopen("test.txt", "r");
    yyparse();
    return 0;
}