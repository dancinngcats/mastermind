require_relative 'test_helper'

class PatternTest < Minitest::Test
  def setup
    @peg1_response = Peg.new(:response, "Black")
    @peg2_response = Peg.new(:response, "White")

    @peg1_guess = Peg.new(:guess, "Red")
    @peg2_guess = Peg.new(:guess, "Green")
    @peg3_guess = Peg.new(:guess, "Blue")
    @peg4_guess = Peg.new(:guess, "Yellow")

    @peg1_input = Peg.new(:input, "Red")
    @peg2_input = Peg.new(:input, "Yellow")
    @peg3_input = Peg.new(:input, "Blue")
    @peg4_input = Peg.new(:input, "Green")
  end

  def test_it_exists_for_response
    # skip
    pattern_response = Pattern.new(@peg1_response, @peg2_response, @peg1_response, @peg2_response)
    assert_instance_of Pattern, pattern_response
  end

  def test_it_can_hold_guess_type
    pattern_guess = Pattern.new(@peg1_guess, @peg2_guess, @peg3_guess, @peg4_guess)

    assert_equal :guess, pattern_guess.peg1.type
  end

  def test_it_can_hold_input
    # skip
    pattern_input = Pattern.new(@peg1_input, @peg2_input, @peg3_input, @peg4_input)

    assert_equal :input, pattern_input.peg1.type
  end

  def test_pegs_can_go_in_array
    pattern_input = Pattern.new(@peg1_input, @peg2_input, @peg3_input, @peg4_input)

    assert_equal Array, pattern_input.array.class
  end

  def test_it_can_return_an_array_of_colors
    pattern_input = Pattern.new(@peg1_input, @peg2_input, @peg3_input, @peg4_input)

    assert_equal ["Red", "Yellow", "Blue", "Green"], pattern_input.return_colors
  end

  def test_it_can_return_an_array_of_type
    pattern_input = Pattern.new(@peg1_input, @peg2_input, @peg3_input, @peg4_input)

    assert_equal [:input, :input, :input, :input], pattern_input.return_type
  end

  def test_it_can_return_an_index_from_return_colors_method
    pattern_input = Pattern.new(@peg1_input, @peg2_input, @peg3_input, @peg4_input)

    assert_equal "Red", pattern_input.return_colors[0]
  end

  def test_it_can_retun_an_index_from_return_type_method
    pattern_input = Pattern.new(@peg1_input, @peg2_input, @peg3_input, @peg4_input)

    assert_equal :input, pattern_input.return_type[3]
  end
end
