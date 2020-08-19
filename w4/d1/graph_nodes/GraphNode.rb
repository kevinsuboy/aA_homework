require 'set'
class GraphNode
    attr_reader :value
    attr_accessor :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end
end

def bfs(starting_node, target)
    q = [starting_node]
    visited = Set.new()
    visited.add(starting_node)
    while !q.empty?
        node = q.shift
        # p node.value
        return node if node.value == target
        node.neighbors.each do |n|
            q << n unless visited.include?(n)
            visited.add(n)
        end
    end
    return nil
end

if __FILE__ == $PROGRAM_NAME
    a = GraphNode.new('a')
    b = GraphNode.new('b')
    c = GraphNode.new('c')
    d = GraphNode.new('d')
    e = GraphNode.new('e')
    f = GraphNode.new('f')
    a.neighbors = [b, c, e]
    c.neighbors = [b, d]
    e.neighbors = [a]
    f.neighbors = [e]
    p bfs(a, "b")
    p bfs(a, "f")
end