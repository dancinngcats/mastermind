class Pattern
  attr_reader :peg1, :peg2, :peg3, :peg4, :array

  def initialize(peg1, peg2, peg3, peg4)
    @peg1 = peg1
    @peg2 = peg2
    @peg3 = peg3
    @peg4 = peg4
    @array = [peg1, peg2, peg3, peg4]
  end

  def return_colors(specify)
    colors_array = []
    specify.array.each do |element|
      colors_array << specify.array.color
    end
  end
end
