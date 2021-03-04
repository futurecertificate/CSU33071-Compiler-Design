%{
int evens = 0;
%}
%%

    [[:digit:]]*[02468][[:space:]]	{ evens++; }
    \n		
    .		
%%
    	
int main()
{
    yylex();
    printf("%8d\n", evens);
    return 0;
}