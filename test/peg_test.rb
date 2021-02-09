require_relative 'test_helper'

class PegTest < Minitest::Test

  def setup
    @peg = Peg.new(:small, "Blue")
  end

  def test_it_exists
    assert_instance_of Peg, @peg
  end

  def test_it_has_readable_attributes
    assert_equal :small, @peg.type
    assert_equal "Blue", @peg.color
  end
