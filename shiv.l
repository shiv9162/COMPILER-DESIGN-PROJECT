%{
    #include<stdio.h>
    #include "y.tab.h" 
%}

%%
"class"  {return CLASS;}
"void"      {return VOID;}
"int"       {return INT;}
"float"     {return FLOAT;}
"String"    {return STRING;}
"char"      {return CHAR;}
"return"    {return RETURN;}
","         {return SEP;}
";"         {return DELIM;}

"="         {return ASSIGN;}
"=="         {return EQ;}
"<"         {return LT;}
">"         {return GT;}
">="        {return GE;}
"<="        {return LE;}
"!="        {return NE;}

"+"         {return ADD;}
"-"         {return SUB;}
"*"         {return MUL;}
"/"         {return DIV;}

"{"        {return OP_CBR;}
"}"        {return CL_CBR;}

"("        {return OP_BR;}
")"        {return CL_BR;}

[a-zA-Z_]+  {return ID;}
[0-9]+      { yylval = atoi(yytext); return NUM;}

[ \n\t]     ;


%%

int yywrap() {
    return 1;
}