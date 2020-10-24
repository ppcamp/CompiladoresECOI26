///////////////////////////////////////////////////////////////////////////////
// Código do usuário (antes da declaração da classe)
///////////////////////////////////////////////////////////////////////////////
package src;


%%
///////////////////////////////////////////////////////////////////////////////
// Funções e variáveis internas da classe
///////////////////////////////////////////////////////////////////////////////

%{
private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + "\t- " + descricao);
}
%}


///////////////////////////////////////////////////////////////////////////////
// Definições do lexer/programa gerado
///////////////////////////////////////////////////////////////////////////////
%class LexicalAnalyzer
%line
%unicode
// %debug
// %column
// %char
// Apenas para debugar sem precisar de fazer o código principal.
// %standalone
// %eof{
// %init{


///////////////////////////////////////////////////////////////////////////////
// Definições da linguagem (shortcuts for regex)
///////////////////////////////////////////////////////////////////////////////

BODY        = "begin".*"end"
LINECOMMENT = \%.*
NUMBER      = [\d]+
SPACE       = [\s\n]
STRING      = \"[\w\W]+\"
VARIABLE    = [a-z|A-Z]+[_|a-z|A-Z|0-9]*[^\W_]*


%%
///////////////////////////////////////////////////////////////////////////////
// Regras léxicas
///////////////////////////////////////////////////////////////////////////////
// Program operations
"+"             { imprimir("Plus", yytext()); }
"-"             { imprimir("Minus", yytext()); }
"*"             { imprimir("Asterisk", yytext()); }
"/"             { imprimir("Slash", yytext()); }
"="             { imprimir("Equal", yytext()); }
"<"             { imprimir("LessThan", yytext()); }
">"             { imprimir("GreaterThan", yytext()); }
"["             { imprimir("LeftBracket", yytext()); }
"]"             { imprimir("RightBracket", yytext()); }
","             { imprimir("Comma", yytext()); }
";"             { imprimir("SemiColon", yytext()); }
"("             { imprimir("LeftParenthesis", yytext()); }
")"             { imprimir("RightParenthesis", yytext()); }
"<>"            { imprimir("LessThanGreaterThan", yytext()); }
"<="            { imprimir("LessThanEqual", yytext()); }
">="            { imprimir("GreaterThanEqual", yytext()); }
":="            { imprimir("ColonEqual", yytext()); }
// "."             { imprimir("Period", yytext()); }
// "^"             { imprimir("Pointer", yytext()); }
// ".."            { imprimir("PeriodPeriod", yytext()); }

// Program modificators
"and"           { imprimir("And", yytext()); }
"begin"         { imprimir("Begin", yytext()); }
"div"           { imprimir("Div", yytext()); }
"do"            { imprimir("Do", yytext()); }
"else"          { imprimir("Else", yytext()); }
"end"           { imprimir("End", yytext()); }
"if"            { imprimir("If", yytext()); }
"mod"           { imprimir("Mod", yytext()); }
"not"           { imprimir("Not", yytext()); }
"or"            { imprimir("Or", yytext()); }
"program"       { imprimir("Program", yytext()); }
"then"          { imprimir("THEN", yytext()); }
"while"         { imprimir("WHILE", yytext()); }
"integer"       { imprimir("INT", yytext()); }
// "downto"        { imprimir("Downto", yytext()); }
// "array"         { imprimir("ARRAY", yytext()); }
// "case"          { imprimir("Case", yytext()); }
// "const"         { imprimir("Const", yytext()); }
// "file"          { imprimir("File", yytext()); }
// "for"           { imprimir("For", yytext()); }
// "function"      { imprimir("Function", yytext()); }
// "goto"          { imprimir("Goto", yytext()); }]
// "label"         { imprimir("Label", yytext()); }
// "in"            { imprimir("In", yytext()); }
// "nil"           { imprimir("Nil", yytext()); }
// "of"            { imprimir("Of", yytext()); }
// "packed"        { imprimir("Packed", yytext()); }
// "procedure"     { imprimir("Procedure", yytext()); }
// "record"        { imprimir("Record", yytext()); }
// "repeat"        { imprimir("Repeat", yytext()); }
// "set"           { imprimir("Set", yytext()); }
// "to"            { imprimir("To", yytext()); }
// "until"         { imprimir("Until", yytext()); }
// "var"           { imprimir("Var", yytext()); }
// "with"          { imprimir("With", yytext()); }
// "type"          { imprimir("Type", yytext()); }

// More operation enpowering
"true"          { imprimir("True", yytext()); }
"false"         { imprimir("False", yytext()); }
"**"            { imprimir("AsteriskAsterisk", yytext()); }
"-="            { imprimir("SubtractAndSave", yytext()); }
"*="            { imprimir("MultiplyAndSave", yytext()); }
"+="            { imprimir("SumAndSave", yytext()); }
"/="            { imprimir("DivideAndSave", yytext()); }
"?"             { imprimir("TernaryIf", yytext()); }
":"             { imprimir("TernaryElse", yytext()); }
"\""            { imprimir("Quotes", yytext()); }

// Bit Operation
"<<"            { imprimir("ShiftLeft", yytext()); }
">>"            { imprimir("ShiftRight", yytext()); }
"<<<"           { imprimir("ShiftRigthMost", yytext()); }
">>>"           { imprimir("ShiftLeftMost", yytext()); }
"|"             { imprimir("ExclusiveOr", yytext()); }
"ones"          { imprimir("OneComplement", yytext()); }
"twos"          { imprimir("TwoComplement", yytext()); }

// Others configs
"declare"       { imprimir("Declare", yytext()); }
"read"          { imprimir("Read", yytext()); }
"write"         { imprimir("Write", yytext()); }
{BODY}          { imprimir("Body", yytext()); }
{LINECOMMENT}   { imprimir("Comment", yytext()); }
{NUMBER}        { imprimir("Number", yytext()); }
{SPACE}         { imprimir("Space", "\\s|\\n"); }
{VARIABLE}      { imprimir("Variable", yytext()); }
// "#"            { imprimir("NotImplemented", yytext()); }
// "$"            { imprimir("NotImplemented", yytext()); }

// Para qualquer entrada não listada
. { throw new RuntimeException("Caractere invalido " + yytext()); }