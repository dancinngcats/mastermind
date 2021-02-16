class Codemaker
  attr_accessor :code
  def initialize
    @code = generate_random_string(length = 4)
  end

  def generate_random_string(length=4)
    result = []
    library = ["r", "g", "b", "y"]
    length.times do
    result << library[rand(library.length)]
    end
  result
  end
end
