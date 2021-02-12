require_relative 'test_helper'

class CodemakerTest < Minitest::Test

  def setup
    # 3 categories
    # codemaker
    # codebreaker
    # feedback - not necessary when playing a computer

    @pattern = Codemaker.new()
    # delete dead code
    @peg1 = Peg.new("Red")
    @peg2 = Peg.new("Yellow")
    @peg3 = Peg.new("Blue")
    @peg4 = Peg.new("Green")

  end

  # def test_it_exists
  #   assert_instance_of
  # end
  #
  # def test_it_returns_an_array
  # end
end
