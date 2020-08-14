  class Stack
    def initialize
      # create ivar to store stack here!
      @arr = []
    end

    def push(el)
      # adds an element to the stack
      @arr << el
      return true
    end

    def pop
      # removes one element from the stack
      @arr.pop()
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @arr[-1]
    end
  end

  if __FILE__ == $PROGRAM_NAME
    s = Stack.new
    s.push(5)
    p s.peek
    s.push(4)
    p s.peek
    s.push(3)
    p s.peek
    s.push(2)
    p s.peek
    s.push(1)
    p s.peek
  end