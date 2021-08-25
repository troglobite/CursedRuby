class Interpreter
  def initialize
    @names = {}
    @stack = Scope.new()
  end

  class Scope
    attr_accessor :names

    def initialize(names = {})
      @names = names
    end
  end

  def evaluate(tree)
    case tree.operation
    when :number then number(*tree.arguments)
    when :assign then assign(*tree.arguments)
    when :lookup then lookup(*tree.arguments)
    when :+, :-, :*, :/
      tree.arguments.map(&method(:evaluate)).reduce(&tree.operation)
    end
  end

  def number(value)
    value
  end

  def assign(name, value)
    @stack.names[name] = value
  end

  def lookup(name)
    puts @stack.names[name].arguments.first
  end
end
