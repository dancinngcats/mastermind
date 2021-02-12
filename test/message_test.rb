require_relative 'test_helper'

class MessageTest < Minitest::Test

  def setup
    @message = Message.new
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_it_can_return_hello_msg
    result = "Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal result, @message.introduction
  end

  def test_it_can_return_quit_msg
    result = "We are sorry to see you go... Come again. Or not."
    assert_equal result, @message.quit
  end

  def test_it_can_return_cheat_msg
    result = "Okay, we will help. Here is your cheat code:"
    assert_equal result, @message.cheat
  end

  def test_it_can_return_guess_is_too_short
    result = "Your guess does not have enough characters... Pay attention and try again."
    assert_equal result, @message.short_guess
  end

  def test_it_can_return_guess_is_too_long
    result = "C'mon... Your guess does not have enough characters. Try again."
    assert_equal result, @message.long_guess
  end

  def test_it_can_return_end_game_message
    result = "Wonderful job! Did you have fun? We know you did. Come again."
    assert_equal result, @message.end_game
  end

  def test_it_can_return_singular_feedback
    result = "'RRGB' has 3 of the correct elements with 2 in the correct positions you've taken 1 guess"
    assert_equal result, @message.feedback
  end

end
