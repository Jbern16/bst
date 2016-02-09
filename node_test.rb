gem 'minitest', '>= 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'node'
require_relative 'binary_search_tree'

class NodeTest < Minitest::Test

  def test_node_has_data
    node = Node.new(100, "Fifth Element")
    assert_equal 100, node.score
  end

  def test_node_left_child_is_nil
    node = Node.new(100, "Fifth Element")
    assert_equal nil, node.left_child
  end

  def test_node_right_child_is_nil
    node = Node.new(100, "Fifth Element")
    assert_equal nil, node.right_child
  end

  def test_node_has_a_depth_of_0_at_root
    bst = BinarySearchTree.new
    node = bst.insert(100, "Fifth Element")
    assert_equal 0, node.depth
  end


end




# jons_first_node = Node.new
# @data = [99, "Movie"]
# @left_child = Node.new[98, "Movie_2"]
# @right_child = Node.new[100, "Movie_3"]
