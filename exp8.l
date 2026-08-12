%{
#include <stdio.h>

int word_count = 0;
int line_count = 0;
%}

%%

[\t]+              ;
\n                 { line_count++; }
[A-Za-z0-9_]+      { word_count++; }
.                  ;

%%

int main(void)
{
    printf("Enter text (Ctrl+Z to end input on Windows):\n");

    yylex();

    printf("\nTotal Lines: %d\n", line_count);
    printf("Total Words: %d\n", word_count);

    return 0;
}

int yywrap()
{
    return 1;
}
