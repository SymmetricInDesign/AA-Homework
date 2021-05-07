class Stack
    def initialize
      @var = []
    end

    def push(el)
      @var << el
    end

    def pop
      @var.pop
    end

    def peek
      @var[-1]
    end
end

stack = Stack.new

stack.push("rat")
stack.push("cat")
p stack.pop