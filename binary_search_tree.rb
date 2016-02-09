require 'pry'
require_relative 'node'


class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(score, name, depth=0, current_node=@root)
    if @root == nil
      @root = Node.new(score, name, depth)
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
    if @root == nil
      false
    else
      if score == @root.score
        true
      elsif score < current_node.score
        # split up
        if  current_node.left_child.score == score
            true
        else
           current_node = current_node.left_child
           include?(score, name, current_node)
        end
      elsif score > current_node.score
        # split up
        if current_node.right_child.score == score
            true
        else
           current_node = current_node.right_child
           include?(score, name, current_node)
        end
      else
        false
      end
    end
   end



end
