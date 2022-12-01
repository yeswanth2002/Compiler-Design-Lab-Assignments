/* 8. Count of Words ending with ab. */

%option noyywrap
%{
	int count = 0;
%}
%%

.*ab" "|.*ab\n {count++;ECHO;}
%%

main()
{
	yylex();
	printf("%d\n",count);
	return 0;
}
