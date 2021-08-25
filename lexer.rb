require 'rly'

class Lexer < Rly::Lex
  literals "+-*/="

  ignore " \t\n"

  token :NUMBER, /\d+/
  token :NAME, /[a-zA-Z_]+/

  on_error do |t|
    puts "Illegal character #{t.value}"
    t.lexer.pos += 1
    nil
  end
end
