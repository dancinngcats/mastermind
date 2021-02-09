class Player

  attr_reader :name, :pattern

  def initialize(name, pattern)
    @name = name
    @pattern = pattern
    @has_lost = false
  end


  def has_won?
    @has_lost
    # pattern_input.return_colors == @pattern.return_colors
  end

end
