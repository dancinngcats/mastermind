require_relative 'test_helper'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_readable_attributes
    assert_instance_of Codemaker, @turn.codemaker

    assert_nil @turn.guess
    assert_equal false, @turn.won
    assert_equal 0, @turn.number_correct
  end

  def test_player_guess_can_store_guess
    assert_nil @turn.guess

    @turn.player_guess("rygb")

    assert_equal "rygb", @turn.guess
  end

  def test_player_guess_returns_downcase
    @turn.player_guess("RYGB")

    assert_equal "rygb", @turn.guess
  end

  def test_correct_characters_method
    assert_nil @turn.guess

    @turn.player_guess("zzz")

    assert_equal false, @turn.correct_characters?

    @turn.player_guess("RyGB")

    assert_equal true, @turn.correct_characters?
  end

  def test_index_checker_method
    @turn.player_guess("rygb")
    @turn.index_checker

    assert_instance_of Integer, @turn.number_correct
  end

  def test_correct_length_method
    @turn.player_guess("ry")

    assert_equal (-1), @turn.correct_length?

    @turn.player_guess("rrrrrr")

    assert_equal 1, @turn.correct_length?

    @turn.player_guess("rygb")

    assert_equal true, @turn.correct_length?
  end

  def test_access_code_method
    assert_instance_of Array, @turn.access_code
  end
end
