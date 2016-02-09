class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, name, current_node=@root)
    if @root == nil
      @root = Node.new(score, name)
    elsif (score < current_node.score)
      # split up
      if  current_node.left_child == nil
          current_node.left_child = Node.new(score, name)
      else
         current_node = current_node.left_child
         insert(score, name, current_node)
      end
    elsif score > current_node.score
      # split up
      if current_node.right_child == nil
          current_node.right_child = Node.new(score, name)
      else
         current_node = current_node.right_child
         insert(score, name, current_node)
      end
    end
  end

  def include?(score, name, current_node=@root)
    if score == current_node
      true
    elsif score == current_node.left_child
      true

    elsif score == current.node.right_child
      true
    else
    end
  end



end
