require_relative 'test_helper'

class CodemakerTest < Minitest::Test
  def test_it_exists
    codemaker = Codemaker.new
    assert_instance_of Codemaker, codemaker
  end

  def test_it_has_readable_attributes
    codemaker = Codemaker.new
    assert_instance_of Array, codemaker.code
  end
end
