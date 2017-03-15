require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :root, :last
  def initialize(val)
    @root = Node.new(val, nil)
    @last = root
  end

  def push(val)
    last.next_node = Node.new(val, nil)
    @last = @last.next_node
  end

  def insert(index, value)
    current = root
    (index - 1).times do
      current = current.next_node
    end
    inserted_node = Node.new(value, nil)
    inserted_node.next_node = current.next_node
    current.next_node = inserted_node
  end

  def show_all_values
    current = root
    node_position = 0
    while true
      puts "The node at position #{node_position} has a value of #{current.val}"
      break if current.next_node == nil
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

ll.push("Hello")
ll.push("Herp")
ll.push("Hedf")
ll.push("Hesa")
ll.push("He34o")
ll.push("He12")
ll.show_all_values
ll.delete("Hesa")
ll.insert(3, "insertedyo")
ll.show_all_values
''
