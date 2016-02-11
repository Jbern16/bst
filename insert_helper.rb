module InsertHelper
  
  def insert_right(score, name, current_node)
    if current_node.right_child == nil
      current_node.right_child = Node.new(score, name)
    else
      current_node = current_node.right_child
      insert(score, name, current_node)
    end
  end

  def insert_left(score, name, current_node)
    if  current_node.left_child == nil
      current_node.left_child = Node.new(score, name)
    else
      current_node = current_node.left_child
      insert(score, name, current_node)
    end
  end
end
