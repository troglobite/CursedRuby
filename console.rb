require 'rly'
require 'readline'
require 'pry'
require './lexer'
require './parser'
require './interpreter'

lexer = Lexer.new()
parser = Parser.new(lexer)
interpreter = Interpreter.new

while (buffer = Readline.readline('>', true))
  parse_tree = parser.parse(buffer)
  puts parse_tree
  puts interpreter.evaluate(parse_tree)
end
