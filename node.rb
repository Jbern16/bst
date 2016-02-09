class Node
  attr_accessor :score, :name, :left_child, :right_child


  def initialize(score, name, left_child=nil, right_child=nil)
    @score = score
    @name = name
    @left_child = left_child
    @right_child = right_child
  end


end
