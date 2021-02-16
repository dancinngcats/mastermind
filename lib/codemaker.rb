class Codemaker
  attr_reader :code
  def initialize
    @code = ["r", "b", "g", "y"].shuffle
  end

end
