# CompilaOuIterpreta :poop:

versão: 0.1

_Projeto configurado em VScode._

## Gramática da Linguagem Mini (a ser desenvolvida):

<pre>
program ::= program identifier body
body ::= [declare decl-list] begin stmt-list end
decl-list ::= decl {";" decl}
decl ::= type ident-list
ident-list ::= identifier {"," identifier}
type ::= integer
stmt-list ::= stmt {";" stmt}
stmt ::= assign-stmt | if-stmt | while-stmt
| read-stmt | write-stmt
assign-stmt ::= identifier ":=" simple_expr
if-stmt ::= if condition then stmt-list end
| if condition then stmt-list else stmt-list end
condition ::= expression
while-stmt ::= do stmt-list stmt-suffix
stmt-suffix ::= while condition
read-stmt ::= read "(" identifier ")"
write-stmt ::= write "(" writable ")"
writable ::= simple-expr | literal
expression ::= simple-expr | simple-expr relop simple-expr
simple-expr ::= term | simple-expr addop term
 | "(" simple-expr ")" ? simple-expr ":" simple-expr
term ::= factor-a | term mulop factor-a
fator-a ::= factor | not factor | "-" factor
factor ::= identifier | constant | "(" expression ")"
relop ::= "=" | ">" | ">=" | "<" | "<=" | "<>"
addop ::= "+" | "-" | or
mulop ::= "*" | "/" | mod | and
shiftop ::= "<<" | ">>" | "<<<" | ">>>"
constant ::= digit {digit}
literal ::= " “" {caractere} "”"
identifier ::= letter {letter | digit}
letter ::= "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J"
| "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T"
| "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d"
| "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n"
| "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x"
| "y" | "z"
digit ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
caractere ::= um dos 256 caracteres do conjunto ASCII, exceto "
</pre>

<br/><br/>

**Outras características de Mini**

-   As palavras-chave de Mini são reservadas.

-   Toda variável deve ser declarada antes do seu uso.

-   A semântica dos demais comandos e expressões é a tradicional do Pascal.

-   Entrada e saída de Mini estão limitadas ao teclado e à tela de seu computador.

-   Comentários de uma linha em Mini começam com %

<br/>

**# Testes:**

<pre>
Teste 1:
program teste1
declare
 integer a, b, c;
 integer result;
begin
 read (a);
 read (c);
 b := 10;
 result := (a * c)/(b + 5 % 345 -3) ;
 write(result)
end

Teste 2:
program teste2
declarando
 integer a;
 integer b;
 integer c;
begin
 read (a);
 b := a * a;
 c := b + a/2 * (3 + 5);
 write(c)
end;

Teste 3:
program teste3
declare
 integer id, qtd, cont, soma;
begin
 qtd := 5;
 cont := 5;
 soma := 0;
 do
 write(“Idade: ”);
 read (id);
 soma := soma # id;
 cont := cont – 1;
 while(cont > 0);
 write(“Media: ”);
 write (soma / qtd);
end

Teste 4:
program teste4
declare
 integer i, j, k, _var1;
begin
 i := 4 * (5-3) * -50 / 10;
 j := i * 10;
 k := i* j / k;
 k := -4 + 3 $;
 write(i);
 write(j);
 write(k);
end

Teste 5:
program teste5
% programa com if
declare
 integer j, k;
 begin
 read(j);
 read(k);
 if (k <> 0) then
 result := j/k
 else
 result := 0
 end
end

Teste 6:
program teste6
declare
 integer a, b, c, maior;
begin
 read(a);
 read(b);
 read(c);
 % identifica o maior
 if ( a>b and a>c ) then
 maior := a
 else
 if (b>c) then
 maior := b
 else
 maior := c
 end
 end;
 write(maior);
end

Teste 7:
program teste6
declare
 integer a, b, c, maior;
begin
 read(a);
 read(b);
 read(c);
 % identifica o maior
 maior:= (a>b and a>c)?a:(b>c)?b:c;
 write(maior);
end
</pre>

---

<br/><br/>

## Comentários:

> @ppcamp
>
> [Jflex tutorial](https://www.youtube.com/watch?v=IV1Rwq7ERR4&ab_channel=MiftaSintaha "Vídeo")

> @ppcamp
>
> Links e configurações:
>
> -   [Markdown](https://guides.github.com/features/mastering-markdown/)
>
> -   [Jflex](https://www.youtube.com/watch?v=WLHn5JzLx6I&ab_channel=D.KAl "Como instalar")
>
> -   [Chocolatey (apt para windows)](https://chocolatey.org/install)
>
> -   Java (no choco): digite `choco install openjdk` no powershell como adm.

> @ppcamp
>
> **Instale as extensões recomendadas:** `@recommended`. Modificações sempre em stack.
