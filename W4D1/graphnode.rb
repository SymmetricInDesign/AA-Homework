class GraphNode

    attr_accessor :neighbors

    def self.bfs(starting_node, target_value)
        explored = [starting_node]
        return starting_node if starting_node.value == target_value
        
    end

    def initialize(value)
        @value = value
        @neighbors = []
    end

    
    
end
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

p a