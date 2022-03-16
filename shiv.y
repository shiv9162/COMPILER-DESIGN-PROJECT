%{
    #include<stdio.h>    
    extern FILE* yyin;
%}

%token CLASS ID NUM VOID INT FLOAT CHAR STRING LE LT GE GT EQ NE ASSIGN ADD SUB MUL DIV DELIM SEP OP_BR CL_BR CL_CBR OP_CBR RETURN

%%
program : CLASS ID OP_CBR function CL_CBR  {printf("SYntactically correct\n"); return 0;}
        ;

function : dataType ID OP_BR parameters CL_BR OP_CBR body CL_CBR
         ;

parameters : |
             dataType ID SEP parameters
             | dataType ID
             ;

return : |
          RETURN ID DELIM
          ;

body :  statement DELIM body
        | statement DELIM return 
        ;

dataType : VOID | INT | CHAR | FLOAT | STRING 
             ;

statement : dataType ID
            | dataType ID ASSIGN value
            | ID ASSIGN expr    {printf("value = %d\n", $3);}
            ;

expr : value op expr  {$$ = $1 + $3;}
        | value op value {$$ = $$ + $3;}
        ;

op : ADD | DIV | MUL | SUB
    ;

value : ID 
        | NUM   {$$ = $1;}
        ;


%%

void yyerror(const char* e) {
    printf("%s", e);
}

int main() {
    yyin = fopen("test.txt", "r");
    yyparse();
    return 0;
}