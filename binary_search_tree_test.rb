gem 'minitest', '>= 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_search_tree'
require_relative 'node'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @bst = BinarySearchTree.new
  end

  def test_binary_search_tree_exists
    assert @bst, BinarySearchTree.new
  end

  def test_node_is_inserted_into_the_tree_when_insert_is_called
    @bst.insert(100, "Fifth Element")
    assert_equal 100, @bst.root.score
  end

  def test_node_is_inserted_into_the_tree_when_insert_is_called_left_child
      @bst.insert(100, "Fifth Element")
      @bst.insert(90, "Star Wars")
      assert_equal 90, @bst.root.left_child.score
  end

  def test_node_is_inserted_into_the_tree_when_insert_is_called_right_child
    @bst.insert(100, "Fifth Element")
    @bst.insert(110, "Pulp Fiction")
    assert_equal 110, @bst.root.right_child.score
  end

  def test_node_is_inserted_correctly_if_root_and_child_are_not_nil_right
    @bst.insert(100, "Fifth Element")
    @bst.insert(110, "Pulp Fiction")
    @bst.insert(112, "Knight's Tale")
    assert_equal 112, @bst.root.right_child.right_child.score
  end


  def test_node_is_inserted_correctly_if_root_and_child_are_not_nil_left
    @bst.insert(100, "Fifth Element")
    @bst.insert(90, "Star Wars")
    @bst.insert(85, "Fight Club")
    assert_equal 85, @bst.root.left_child.left_child.score
  end

  def test_node_is_included_into_the_tree
    @bst.insert(100, "Fifth Element")
    assert @bst.include?(100, "Fifth Element")
  end

  def test_node_is_included_into_the_tree_multiple_node
    @bst.insert(100, "Fifth Element")
    @bst.insert(90, "Star Wars")
    @bst.insert(85, "Fight Club")
    assert @bst.include?(85, "Fight Club")
  end



 end
