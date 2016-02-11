gem 'minitest', '>= 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_search_tree'
require_relative 'node'

class BinarySearchTreeTest < Minitest::Test
  attr_accessor :bst
  def setup
    @bst = BinarySearchTree.new
  end

  def test_binary_search_tree_exists
    assert bst, BinarySearchTree.new
  end

  def test_node_is_inserted_into_the_tree_when_insert_is_called
    bst.insert(100, "Fifth Element")
    assert_equal 100, bst.root.score
  end

  def test_node_is_inserted_into_the_tree_when_insert_is_called_left_child
      bst.insert(100, "Fifth Element")
      bst.insert(90, "Star Wars")
      assert_equal 90, bst.root.left_child.score
  end

  def test_node_is_inserted_into_the_tree_when_insert_is_called_right_child
    bst.insert(100, "Fifth Element")
    bst.insert(110, "Pulp Fiction")
    assert_equal 110, bst.root.right_child.score
  end

  def test_node_is_inserted_correctly_if_root_and_child_are_not_nil_right
    bst.insert(100, "Fifth Element")
    bst.insert(110, "Pulp Fiction")
    bst.insert(112, "Knight's Tale")
    assert_equal 112, bst.root.right_child.right_child.score
  end


  def test_node_is_inserted_correctly_if_root_and_child_are_not_nil_left
    bst.insert(100, "Fifth Element")
    bst.insert(90, "Star Wars")
    bst.insert(85, "Fight Club")
    assert_equal 85, bst.root.left_child.left_child.score
  end

  def test_node_is_included_into_the_tree
    bst.insert(100)
    assert bst.include?(100)
  end

  def test_node_is_included_into_the_tree_multiple_nodes
    bst.insert(100)
    bst.insert(90)
    bst.insert(85)
    assert bst.include?(85)
  end

  def test_node_has_a_depth_of_0_at_root
    bst.insert(100, "Fifth Element")
    assert_equal 0, bst.depth_of(100)
  end


  def test_node_has_a_depth_of_2_when_it_has_two_parents_left_child
    bst.insert(100, "Fifth Element")
    bst.insert(90, "Star Wars")
    bst.insert(85, "Fight Club")
    assert_equal 2, bst.depth_of(85)

  end

  def test_node_has_a_depth_of_2_when_it_has_two_parents_right_child
    bst.insert(100, "Fifth Element")
    bst.insert(110, "Pulp Fiction")
    bst.insert(112, "Knight's Tale")
    assert_equal 2, bst.depth_of(112)
  end

  def test_node_depth_mixed_children
    bst.insert(100, "Fifth Element")
    bst.insert(110, "Pulp Fiction")
    bst.insert(90, "Star Wars")
    bst.insert(112, "Knight's Tale")
    bst.insert(85, "Fight Club")
    assert_equal 2, bst.depth_of(85)
  end

  def test_find_max_score
    bst.insert(100, "Fifth Element")
    bst.insert(110, "Pulp Fiction")
    bst.insert(112, "Knight's Tale")
    assert_equal Hash["Knight's Tale", 112], bst.max
  end

  def test_find_min_score
    bst.insert(100, "Fifth Element")
    bst.insert(90, "Star Wars")
    bst.insert(85, "Fight Club")
    assert_equal Hash["Fight Club", 85], bst.min
  end

  def test_sort_returns_a_sorted_array_of_hashes_from_lowest_to_highest
    bst.insert(100, "Fifth Element")
    bst.insert(110, "Pulp Fiction")
    bst.insert(90, "Star Wars")
    bst.insert(85, "Fight Club")
    assert_equal [ Hash["Fight Club", 85],
     Hash["Star Wars", 90],
     Hash["Fifth Element", 100],
     Hash["Pulp Fiction", 110]], bst.sort
  end

  def test_load_adds_node_name_and_score_from_csv_into_bst
    assert_equal 100, bst.load("movies.txt")
  end

  def test_load_doesnt_add_already_included_values
    bst = BinarySearchTree.new
    bst.insert(17, "Meet My Valentine")
    assert_equal 99, bst.load("movies.txt")
  end

  def test_health_with_many_nodes
    bst.insert(98, "Animals United")
    bst.insert(58, "Armageddon")
    bst.insert(36, "Bill & Ted's Bogus Journey")
    bst.insert(93, "Bill & Ted's Excellent Adventure")
    bst.insert(86, "Charlie's Angels")
    bst.insert(38, "Charlie's Country")
    bst.insert(69, "Collateral Damage")
    assert_equal [[36, 2, 28], [93, 3, 42]], bst.health(2)
  end



 end
