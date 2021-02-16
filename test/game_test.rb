require 'minitest/autorun'
require 'minitest/pride'
require './lib/codemaker'
require './lib/turn'
require './lib/message'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_edge_case_for_loops
    @game.turn.player_guess("c")
    result = @game.cheater_2
    assert_equal result, @game.edge_case_for_loops
    @game.turn.player_guess("as")
    result = @game.short_guess
    assert_equal result, @game.edge_case_for_loops
    @game.turn.player_guess("asdfff")
    result = @game.long_guess
    assert_equal result, @game.edge_case_for_loops
    @game.turn.player_guess("asdr")
    result = @game.right_letters
    assert_equal result, @game.edge_case_for_loops
  end

  def test_all_systems_go_method
    @game.turn.player_guess("rygb")
    assert_equal true, @game.all_systems_go?
    @game.turn.player_guess("asdr")
    assert_equal false, @game.all_systems_go?
    @game.turn.player_guess("ryg")
    assert_equal false, @game.all_systems_go?
  end
end
