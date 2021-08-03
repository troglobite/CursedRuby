class Interpreter
  def initialize
    @names = {}
  end

  def evaluate(tree)
    case tree.operation
    when :number then number(*tree.arguments)
    when :+, :-, :*, :/
      tree.arguments.map(&method(:evaluate)).reduce(&tree.operation)
    end
  end

  def number(value)
    value
  end
end
