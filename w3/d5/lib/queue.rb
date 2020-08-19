class Queue
    def initialize
        @arr = []
    end
    def enqueue(el)
        @arr.unshift(el)
    end
    def dequeue
        @arr.pop
    end
    def peek
        @arr[-1]
        p @arr
    end
end

if __FILE__ == $PROGRAM_NAME
    q = Queue.new
    q.enqueue(5)
    p q.peek
    q.enqueue(4)
    p q.peek
    q.enqueue(3)
    p q.peek
    q.enqueue(2)
    p q.peek
    q.enqueue(1)
    p q.peek
end
