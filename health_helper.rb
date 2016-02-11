module HealthHelper

  def health_helper(depth, current_node)
    if depth_of(current_node.score) == depth
      @counter = 0
      @counter = children_counter(current_node.score, current_node) + 1
      @node_array << current_node.score
      @node_array << @counter
      @node_array << ((@counter / sort.size.to_f) * 100).floor
      @health_report << @node_array
      @node_array = []
      @health_report
    end
    confirm_children(depth, current_node)
  end

  def start_health(depth)
    if @root == nil
      nil
    elsif depth == 0
      child = children_counter(@root.score, @root)
      @node_array << @root.score
      @node_array << child + 1
      @node_array << 100
      @health_report << @node_array
      health_report
    else
      health_helper(depth, @root)
      @health_report
    end
  end


  def confirm_children(depth,current_node)
    if current_node.left_child != nil
     health_helper(depth, current_node.left_child)
    end
    if current_node.right_child != nil
     health_helper(depth, current_node.right_child)
    end
  end

  def children_counter(start, current_node)
    if current_node.score == start
      @counter = 0
    end
    if current_node.left_child != nil
      @counter += 1
      children_counter(start, current_node.left_child)
    end
    if current_node.right_child != nil
      @counter += 1
      children_counter(start, current_node.right_child)
    end
    @counter
  end


end
