%{
#include<stdio.h>
%}

%%
[0-1]*00 {printf("Given string ends with 00");}
[0-1]* {printf("Given string doesn't ends with 00");}
.* {printf("Invalid string");}
%% 

int yywrap() {
return 1;
}

int main() {
printf("Enter the string : ");
yylex();
return 0;
}
