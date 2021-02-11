require_relative 'test_helper'

class PlayerTest < Minitest::Test

  # def setup
  #   @player = Player.new("Kon")
  # end

  def test_it_exists
    peg1_guess = Peg.new(:guess, "Red")
    peg2_guess = Peg.new(:guess, "Green")
    peg3_guess = Peg.new(:guess, "Blue")
    peg4_guess = Peg.new(:guess, "Yellow")

    pattern_guess = Pattern.new(peg1_guess, peg2_guess, peg3_guess, peg4_guess)

    player = Player.new("Kon", pattern_guess)

    assert_instance_of Player, player
  end

  def test_it_has_attributes
    peg1_guess = Peg.new(:guess, "Red")
    peg2_guess = Peg.new(:guess, "Green")
    peg3_guess = Peg.new(:guess, "Blue")
    peg4_guess = Peg.new(:guess, "Yellow")

    pattern_guess = Pattern.new(peg1_guess, peg2_guess, peg3_guess, peg4_guess)

    player = Player.new("Kon", pattern_guess)

    assert_equal "Kon", player.name
    assert_equal pattern_guess, player.pattern
  end

  def test_player_has_won
    peg1_guess = Peg.new(:guess, "Red")
    peg2_guess = Peg.new(:guess, "Green")
    peg3_guess = Peg.new(:guess, "Blue")
    peg4_guess = Peg.new(:guess, "Yellow")

    peg1_input = Peg.new(:input, "Red")
    peg2_input = Peg.new(:input, "Yellow")
    peg3_input = Peg.new(:input, "Blue")
    peg4_input = Peg.new(:input, "Green")

    pattern_input = Pattern.new(peg1_input, peg2_input, peg3_input, peg4_input)

    pattern_guess = Pattern.new(peg1_guess, peg2_guess, peg3_guess, peg4_guess)

    player = Player.new("Kon", pattern_guess)

    player.has_won?

    assert_equal false, player.has_won?
  end


end
