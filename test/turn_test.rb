require_relative 'test_helper'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_accept_user_input
    assert_instance_of String, @turn.user_input("dhghg")
  end

  def test_user_input_returns_sorry_message_if_characters_longer_than_four
    # skip
    @turn.user_input("asdff")
    result = @turn.sorry_message
    assert_equal result, @turn.guess_checker
  end

  def test_user_input_can_only_contain_letters
    # skip
    @turn.user_input("ncbvnh1231")
    result = @turn.sorry_message
    assert_equal result, @turn.guess_checker
  end

  def test_it_can_sanitize_user_input
    skip
    @turn.user_input("Fdlo123")
    @turn.sanitize
    assert_equal "fdlo", @turn.guess

  end

  def test_it_can_compare_user_input_to_code
    skip
    @turn.sanitize("asdf")
    assert_equal false, @turn.compare_input
  end

end
