require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :root, :last
  def initialize(val)
    @root = Node.new(val, nil)
    @last = root
  end

  def <<(val)
    last.next_node = Node.new(val, nil)
    @last = @last.next_node
  end

  def insert(index, value)
    current = root
    (index - 1).times do
      current = current.next_node
    end
    if current == last #handles if some person decided they wanted to insert at the end of the list instead of just use << need to make last that new inserted node
      inserted_node = Node.new(value, nil)
      inserted_node.next_node = current.next_node
      current.next_node = inserted_node
      @last = inserted_node
    else
      inserted_node = Node.new(value, nil)
      inserted_node.next_node = current.next_node
      current.next_node = inserted_node
    end
  end

  def show_all_values
    current, node_position = root, 0
    while true
      puts "The node at position #{node_position} has a value of #{current.val}"
      break if current.next_node.nil?
      current = current.next_node
      node_position += 1
    end
  end



  def delete(val)
    if root.val == val
      @root = root.next_node
    else
      current = root.next_node
      previous = root
      while current && current.val != val
        previous = current
        current = current.next_node
      end
      current.val, current.next_node = current.next_node.val, current.next_node.next_node
      #if it has broken out of the while that means it has found the node to delete so current will be the node to delete
    end
  end


end

ll = LinkedList.new("sup")

ll.<<("Hello")
ll.<<("Herp")
ll.<<("Hedf")
ll.<<("Hesa")
ll.<<("He34o")
ll.<<("He12")
ll.show_all_values
ll.delete("Hesa")
ll.insert(6, "insertedyo")
ll.show_all_values
binding.pry
''
