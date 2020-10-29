import java.io.FileReader;
import java.io.IOException;

import src.LexicalAnalyzer;
import src.MiniToken;

public class MiniLexicalAnalyzer {
  public static void main(String[] args) throws IOException {
    LexicalAnalyzer lexical = new LexicalAnalyzer(new FileReader("code_samples/codigo.mini"));

    MiniToken token;

    while ((token = lexical.yylex()) != null) {
      System.out.println("<" + token.name + ", " + token.value + "> (" + token.line + " - " + token.column + ")");
    }
  }
}