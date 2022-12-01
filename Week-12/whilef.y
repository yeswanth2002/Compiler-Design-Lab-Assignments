%token ID NUM WHILE
%right '='
%left '+' '-'
%left '*' '/'
%left MINUS
%%
S : WHILE{L1();} '(' E ')' {Lcond();} E ';' {End();}
E :V '='{push();} E{codegen_assign();}
  | E '+'{push();} E{codegen_assign();}
  | E '-'{push();} E{codegen_assign();}
  | E '*'{push();} E{codegen_assign();}
  | E '/'{push();} E{codegen_assign();}
  | '(' E ')'
  | '-'{push();} E{codegen_assign();} %prec MINUS
  | V
  | NUM{push();}
  ;
V : ID {push();}
  ;
%%
#include "lex.yy.c"
#include<stdio.h>
char st[100][10];
int top=0;
char temp[3]="t0";
main()
{
printf("Enter the expression : ");
yyparse();
}

push()
{
strcpy(st[++top],yytext);
}

codegen()
{
 printf("%s = %s %s %s\n", temp, st[top-2], st[top-1],st[top]);
 top-=2;
 strcpy(st[top],temp);
temp[1]++;
}

codegen_umin()
{
 printf("%s = -%s\n", temp, st[top]);
 top--;
 strcpy(st[top],temp);
 temp[1]++;
}

codegen_assign()
{
printf("%s = %s\n", st[top-2],st[top]);
top-=2;
}

L1(0)
{
printf("\nL1: \n");
}

Lcond()
{
 printf("%s = not %s\n", temp,st[top]);
 printf("if %s goto End\n", temp);
 temp[1]++;
}

End()
{
 printf("goto L1\n");
 printf("End: end of while loop \n\n");
}
