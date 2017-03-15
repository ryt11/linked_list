require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :nodes
  def initialize
    @nodes = []
  end
  def push(val)
    nodes.empty? ? nodes << Node.new(val, nil) : nodes[nodes.count] = Node.new(val, nil)
    nodes[nodes.count-2].next_node = nodes[nodes.count-1]
  end
end

ll = LinkedList.new

ll.push("Hello")
ll.push("Herp")
ll.push("Hedf")
ll.push("Hesa")
ll.push("He34o")
ll.push("He12")
whats_this = ll.nodes.count
binding.pry
''
