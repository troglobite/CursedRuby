require './operation'
require 'bigdecimal'

class Parser < Rly::Yacc
  rule 'statement : expression' do |statement, expression|
    statement.value = expression.value
  end

  rule 'expression : NUMBER' do |expression, number|
    expression.value = Operation.new(:number, BigDecimal(number.value))
  end

  rule 'statement : NAME "=" expression' do |statement, name, _equals, expression|
    statement.value = Operation.new(:assign, name.value, expression.value)
  end

  rule 'statement : NAME' do |statement, name|
    statement.value = Operation.new(:lookup, name.value)
  end

  rule 'expression : expression "+" expression
                   | expression "-" expression
                   | expression "*" expression
                   | expression "/" expression' do |expression, number_one, symbol, number_two|
    expression.value = Operation.new(symbol.value.to_sym, number_one.value, number_two.value)
  end
end
