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

end
