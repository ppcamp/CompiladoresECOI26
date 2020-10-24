// Para compilar o Jflex
// jflex lexical.jflex
// javac LexicalAnalyzer.java
// java LexicalAnalyzer code_samples/



///////////////////////////////////////////////////////////////////////////////
// Código do usuário (antes da declaração da classe)
///////////////////////////////////////////////////////////////////////////////
// package src;

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
// Cria a tabela de símbolos
// %debug
// Contador de linhas,colunas,char
%line
%column
// %char
// Apenas para debugar sem precisar de fazer o código principal.
%standalone
// %eof{
// %init{


///////////////////////////////////////////////////////////////////////////////
// Definições da linguagem (shortcuts for regex)
///////////////////////////////////////////////////////////////////////////////
// \~ \~
// @NOTA IMPORTANTE: SSAPPORRA LÊ LINHA POR LINHA
// PRIMITIVE types

BODY        = "begin".*"end"
SPACE       = [\s\n]
VARIABLE    = [a-z|A-Z]+[_|a-z|A-Z|0-9]*[^\W_]*
NUMBER      = [\d]+
LINECOMMENT = \%.*
STRING      = \"[\w\W]+\"

%%

///////////////////////////////////////////////////////////////////////////////
// Regras léxicas
///////////////////////////////////////////////////////////////////////////////

"program"       { imprimir("PROGRAMA", yytext()); }
"read"          { imprimir("READ", yytext()); }
"write"         { imprimir("WRITE", yytext()); }
"declare"       { imprimir("VARIAVEIS", yytext()); }
"begin"         { imprimir("BEGIN", yytext()); }
"end"           { imprimir("END", yytext()); }
"if"            { imprimir("IF", yytext()); }
"integer"       { imprimir("INT", yytext()); }
":="            { imprimir("IGUAL", yytext()); }
";"             { imprimir("PONTOVIRGULA", yytext()); }
">="            { imprimir("MAIORIGUAL", yytext()); }
"<="            { imprimir("MENORIGUAL", yytext()); }
"and"           { imprimir("AND", yytext()); }
"or"            { imprimir("OR", yytext()); }
"?"             { imprimir("TERNARIOIF", yytext()); }
":"             { imprimir("TERNARIOELSE", yytext()); }
">"             { imprimir("MAIOR", yytext()); }
"<"             { imprimir("MAIOR", yytext()); }
","             { imprimir("VIRGULA", yytext()); }
"("             { imprimir("PARENTESESL", yytext()); }
")"             { imprimir("PARENTESESR", yytext()); }
{BODY}          { imprimir("CORPO", yytext()); }
{LINECOMMENT}   { imprimir("COMENTARIO", yytext()); }
{VARIABLE}      { imprimir("ID", yytext()); }
{NUMBER}        { imprimir("NUMERO", yytext()); }
{SPACE}         { imprimir("ESPACO", "\\s|\\n"); }

// Para qualquer entrada não listada

. { throw new RuntimeException("Caractere invalido " + yytext()); }