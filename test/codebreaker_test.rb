require_relative 'test_helper'

class CodebreakerTest < Minitest::Test
  def setup
    # 3 categories
    # codemaker
    # codebreaker
    # feedback - not necessary when playing a computer

    @pattern = Codebreaker.new
    # delete dead code
    @peg1 = Peg.new("Red")
    @peg2 = Peg.new("Yellow")
    @peg3 = Peg.new("Blue")
    @peg4 = Peg.new("Green")

    @peg5 = Peg.new("Red")
    @peg6 = Peg.new("Green")
    @peg7 = Peg.new("Blue")
    @peg8 = Peg.new("Yellow")
  end

  def test_it_exists
    assert_instance_of Pattern, @pattern
  end

  def test_it_has_attributes
    assert_equal :code, @pattern.type
  end

  def test_it_has_no_pegs
    assert_equal [], @pattern.pegs
  end

  def test_it_has_pegs
    @pattern.add_peg(@peg1)
    @pattern.add_peg(@peg2)

    assert_equal [@peg1, @peg2], @pattern.pegs
  end

  def test_it_can_return_an_array_of_colors
    @pattern.add_peg(@peg1)
    @pattern.add_peg(@peg2)
    @pattern.add_peg(@peg3)
    @pattern.add_peg(@peg4)

    assert_equal ["Red", "Yellow", "Blue", "Green"], @pattern.return_colors
  end


end
