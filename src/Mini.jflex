///////////////////////////////////////////////////////////////////////////////
// Código do usuário (antes da declaração da classe)
///////////////////////////////////////////////////////////////////////////////
package src;
// import java_cup.runtime.*;

%%
///////////////////////////////////////////////////////////////////////////////
// Funções e variáveis internas da classe
///////////////////////////////////////////////////////////////////////////////

%{
// Creates a token for each new one found
private MiniToken createToken(String name, String lexeme) {
    return new MiniToken( name, lexeme, yyline, yycolumn);
}
%}


///////////////////////////////////////////////////////////////////////////////
// Definições do lexer/programa gerado
///////////////////////////////////////////////////////////////////////////////
%public
%class LexicalAnalyzer
%type MiniToken
%line
%column
// %debug
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
STRING      = \"(\\.|[^\"\\])*\"
VARIABLE    = [a-z|A-Z]+[_|a-z|A-Z|0-9]*[^\W_]*


%%
///////////////////////////////////////////////////////////////////////////////
// Regras léxicas
///////////////////////////////////////////////////////////////////////////////
// Program operations
"+"             { return createToken("Plus", yytext()); }
"-"             { return createToken("Minus", yytext()); }
"*"             { return createToken("Asterisk", yytext()); }
"/"             { return createToken("Slash", yytext()); }
"="             { return createToken("Equal", yytext()); }
"<"             { return createToken("LessThan", yytext()); }
">"             { return createToken("GreaterThan", yytext()); }
"["             { return createToken("LeftBracket", yytext()); }
"]"             { return createToken("RightBracket", yytext()); }
","             { return createToken("Comma", yytext()); }
";"             { return createToken("SemiColon", yytext()); }
"("             { return createToken("LeftParenthesis", yytext()); }
")"             { return createToken("RightParenthesis", yytext()); }
"<>"            { return createToken("LessThanGreaterThan", yytext()); }
"<="            { return createToken("LessThanEqual", yytext()); }
">="            { return createToken("GreaterThanEqual", yytext()); }
":="            { return createToken("ColonEqual", yytext()); }
// "."             { return createToken("Period", yytext()); }
// "^"             { return createToken("Pointer", yytext()); }
// ".."            { return createToken("PeriodPeriod", yytext()); }

// Program modificators
"and"           { return createToken("And", yytext()); }
"begin"         { return createToken("Begin", yytext()); }
"div"           { return createToken("Div", yytext()); }
"do"            { return createToken("Do", yytext()); }
"else"          { return createToken("Else", yytext()); }
"end"           { return createToken("End", yytext()); }
"if"            { return createToken("If", yytext()); }
"mod"           { return createToken("Mod", yytext()); }
"not"           { return createToken("Not", yytext()); }
"or"            { return createToken("Or", yytext()); }
"program"       { return createToken("Program", yytext()); }
"then"          { return createToken("THEN", yytext()); }
"while"         { return createToken("WHILE", yytext()); }
"integer"       { return createToken("INT", yytext()); }
// "downto"        { return createToken("Downto", yytext()); }
// "array"         { return createToken("ARRAY", yytext()); }
// "case"          { return createToken("Case", yytext()); }
// "const"         { return createToken("Const", yytext()); }
// "file"          { return createToken("File", yytext()); }
// "for"           { return createToken("For", yytext()); }
// "function"      { return createToken("Function", yytext()); }
// "goto"          { return createToken("Goto", yytext()); }]
// "label"         { return createToken("Label", yytext()); }
// "in"            { return createToken("In", yytext()); }
// "nil"           { return createToken("Nil", yytext()); }
// "of"            { return createToken("Of", yytext()); }
// "packed"        { return createToken("Packed", yytext()); }
// "procedure"     { return createToken("Procedure", yytext()); }
// "record"        { return createToken("Record", yytext()); }
// "repeat"        { return createToken("Repeat", yytext()); }
// "set"           { return createToken("Set", yytext()); }
// "to"            { return createToken("To", yytext()); }
// "until"         { return createToken("Until", yytext()); }
// "var"           { return createToken("Var", yytext()); }
// "with"          { return createToken("With", yytext()); }
// "type"          { return createToken("Type", yytext()); }

// More operation enpowering
"true"          { return createToken("True", yytext()); }
"false"         { return createToken("False", yytext()); }
"**"            { return createToken("AsteriskAsterisk", yytext()); }
"-="            { return createToken("SubtractAndSave", yytext()); }
"*="            { return createToken("MultiplyAndSave", yytext()); }
"+="            { return createToken("SumAndSave", yytext()); }
"/="            { return createToken("DivideAndSave", yytext()); }
"?"             { return createToken("TernaryIf", yytext()); }
":"             { return createToken("TernaryElse", yytext()); }
"\""            { return createToken("Quotes", yytext()); }

// Bit Operation
"<<"            { return createToken("ShiftLeft", yytext()); }
">>"            { return createToken("ShiftRight", yytext()); }
"<<<"           { return createToken("ShiftRigthMost", yytext()); }
">>>"           { return createToken("ShiftLeftMost", yytext()); }
"|"             { return createToken("ExclusiveOr", yytext()); }
"ones"          { return createToken("OneComplement", yytext()); }
"twos"          { return createToken("TwoComplement", yytext()); }

// Others configs
"declare"       { return createToken("Declare", yytext()); }
"read"          { return createToken("Read", yytext()); }
"write"         { return createToken("Write", yytext()); }
{BODY}          { return createToken("Body", yytext()); }
{LINECOMMENT}   { return createToken("Comment", yytext()); }
{NUMBER}        { return createToken("Number", yytext()); }
{SPACE}         { return createToken("Space", "\\s|\\n"); }
{VARIABLE}      { return createToken("Variable", yytext()); }
{STRING}        { return createToken("Literal", yytext()); }
// "#"            { return createToken("NotImplemented", yytext()); }
// "$"            { return createToken("NotImplemented", yytext()); }

// Para qualquer entrada não listada
. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " + yycolumn); }