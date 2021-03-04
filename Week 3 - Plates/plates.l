%{
%}

NUMBER  [1-9][0-9]{0,5}

COUNTYN     C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW

COUNTYO  C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW

NEWINVALID  LK|TN|TS|WD
OLDINVALID T

YEAROUTLIER  (131|132)
YEARO  ([0189][0-9])
YEARN  (1[0-9](1|2)|2[0-9](1|2))
WHITESPACE (\n|.)
%%
{WHITESPACE}  {}  

{YEARO}(-){COUNTYO}(-){NUMBER}  {char year[] = {yytext[0], yytext[1], '\0'};
int year_convert = atoi(year);
int year_int = (year_convert >= 87 ? 121 - year_convert : 21 - year);    
printf("%d\n", year_int);}

{YEAROUTLIER}(-){COUNTYO}(-){NUMBER}  {char year[] = {yytext[0], yytext[1], '\0'};
int year_convert = atoi(year);
int year_int = (year_convert >= 87 ? 121 - year_convert : 21 - year);     
printf("%d\n", year_int);}

{YEARN}(-){COUNTYN}(-){NUMBER}  {char year[] = {yytext[0], yytext[1], '\0'};
int year_convert = atoi(year);
int year_int = (year_convert >= 87 ? 121 - year_convert : 21 - year);     
printf("%d\n", year_int);}

{YEARO}(-){OLDINVALID}(-){NUMBER}  {printf("INVALID\n");}
{YEAROUTLIER}(-){NEWINVALID}(-){NUMBER}  {printf("INVALID\n");}
{YEARN}(-){NEWINVALID}(-){NUMBER}  {printf("INVALID\n");}

([0-9]*"-"*[a-zA-Z]*"-"*[0-9]*)* {printf("INVALID\n");}

%%

int main(){
    yylex();
    return 0;
}
