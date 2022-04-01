%{
    #include<stdio.h>
    #include "y.tab.h" 
%}

%%
"class"                     {return CLASS;}
"abstract"                  {return ABSTRACT;}
"extends"                   {return EXTENDS;}
"final"                     {return FINAL;}
"public"                    {return PUBLIC;}
"implements"                {return IMPLEMENTS;}
"static"                    {return STATIC;}
"void"                      {return VOID;}
"main"                      {return MAIN;}
"char"                      {return CHAR;}
"float"                     {return FLOAT;}
"int"                       {return INT;}
"String"                    {return STRING;}
"return"                    {return RETURN;}

","                         {return SEP;}
";"                         {return DELIM;}
"="                         {return ASSIGN;}

[a-zA-Z_]+[a-zA-Z0-9_]*     {return ID;}
[0-9]+                      {return NUM;}

"{"                         {return OP_BR;}
"}"                         {return CL_BR;}
"("                         {return OP;}
")"                         {return CL;}
"["                         {return OP_S;}
"]"                         {return CL_S;}

"*"                         {return MUL;}
"+"                         {return ADD;}
"-"                         {return SUB;}
"/"                         {return DIV;}

[ \n\t]                     ;
%%

int yywrap() {
    return 1;
}