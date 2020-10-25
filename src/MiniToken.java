package src;

public class MiniToken {

  public String name;
  public String value;
  public Integer line;
  public Integer column;

  public MiniToken(String name, String value, Integer line, Integer column) {
    this.name = name;
    this.value = value;
    this.line = line;
    this.column = column;
  }
}