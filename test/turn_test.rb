require_relative 'test_helper'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_accept_user_input

    assert_instance_of String, @turn.user_input
  end

  def test_user_input_returns_four_characters
    # skip
    assert_equal "Nah try again", @turn.guess_checker("flksjfldsjf")
  end

  def test_user_input_doesnt_contain_numbers
    skip
  end

  def test_it_can_sanitize_user_input
    assert_equal "rgyb", @turn.sanitize("R GyB")
  end

  def test_it_can_compare_user_input_to_code
    @turn.sanitize("asdf")
    assert_equal false, @turn.compare_input
  end

end
