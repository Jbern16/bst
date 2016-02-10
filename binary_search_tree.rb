require 'pry'
require_relative 'node'


class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
    @depth = 0
  end

  def insert(score, name=nil, current_node=@root)
    if @root == nil
      @root = Node.new(score, name)
    elsif (score < current_node.score)
      insert_left(score, name, current_node)
    elsif score > current_node.score
      insert_right(score, name, current_node)
    end
  end


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


  def include?(score, name=nil, current_node=@root)
    if score == @root.score
      true
    elsif score < current_node.score
      included_left?(score, name=nil, current_node)
      true
    elsif score > current_node.score
      included_right?(score, name=nil, current_node)
      true
    else
      false
    end
  end


   def included_right?(score, name=nil, current_node)
     if current_node.right_child == score
     else
       current_node = current_node.right_child
       include?(score, name, current_node)
     end
   end

   def included_left?(score, name=nil, current_node)
     if current_node.left_child == score
     else
       current_node = current_node.left_child
       include?(score, name, current_node)
     end
   end

   def depth_of(score, current_node=@root)
     if @root == nil
      nil
    elsif @root.score == score
      0
    elsif score < current_node.score
      depth_left(score, current_node)
      @depth
    elsif score > current_node.score
      depth_right(score, current_node)
      @depth
    else
      nil
    end
  end

  def depth_left(score, current_node)
    @depth += 1
    if current_node.left_child == score
    else
      current_node = current_node.left_child
      depth_of(score, current_node)
    end
  end

  def depth_right(score, current_node)
    @depth += 1
    if current_node.right_child == score
    else
      current_node = current_node.right_child
      depth_of(score, current_node)
    end
  end

  def max(current_node=@root)
    until current_node.right_child == nil
      current_node = current_node.right_child
    end
    max_node = Hash[current_node.name, current_node.score]
    max_node
  end

  def min(current_node=@root)
    until current_node.left_child == nil
      current_node = current_node.left_child
    end
    max_node = Hash[current_node.name, current_node.score]
    max_node
  end










end
