require 'pry'
require 'csv'
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
    depth_of(score)
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


  def include?(score, current_node=@root)
    if current_node == nil
      false
    elsif score == current_node.score
      true
    elsif score < current_node.score
      include?(score, current_node.left_child)
    else
      include?(score, current_node.right_child)
    end
  end


   def depth_of(score, current_node=@root, depth = 0)
     if @root == nil
      nil
    else
      if current_node.score == score
        depth
      elsif score < current_node.score
        depth += 1
        depth_of(score, current_node.left_child, depth)
      else
        depth += 1
        depth_of(score, current_node.right_child, depth)
      end
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

  def sort(current_node=@root)
    @sorted_tree = []
    if current_node == nil
      nil
    else
      sort_helper(current_node)
    end
    @sorted_tree
  end

  def sort_helper(current_node)
    if current_node.left_child != nil
      sort_helper(current_node.left_child)
    end
    @sorted_tree << {current_node.name => current_node.score.to_i}
    if current_node.right_child != nil
      sort_helper(current_node.right_child)
    end
    @sorted_tree
  end

  # def load(file)
  #   csv_file = CSV.read(file)
  #   csv_file.select do |score, name|
  #     !include?(score.to_i)
  #   end.map do |score, name|
  #     score = score.to_i
  #       movies = Hash[score.to_i, name.lstrip!]
  #       movies.each_pair do |score, name|
  #         insert(score, name)
  #       end
  #   end.size
  # end

  def load(file)
    lines = CSV.read(file)
    lines.count do |score, name|
      if include?(score.to_i) != true
        insert(score.to_i, name.lstrip)
      end
    end
  end

  def health(depth)
    @children = 1
    @health_report = []
    @node_array = []
    start_health(depth)
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
