require_relative 'test_helper'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_exists
    # skip
    assert_instance_of Game, @game
  end

  def test_start_method_stards_and_ends_game
    # skip
    result = @game.message.end_game
    assert_equal nil, @game.flow
  end

  def test_start_method_prints_instructions
    answer = "i"
    result = @game.message.instructions
    assert_equal result, @game.start

end
