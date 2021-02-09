class Pattern
  attr_reader :peg1, :peg2, :peg3, :peg4, :array

  def initialize(peg1, peg2, peg3, peg4)
    @peg1 = peg1
    @peg2 = peg2
    @peg3 = peg3
    @peg4 = peg4
    @array = [peg1, peg2, peg3, peg4]
  end

  def return_colors
    colors_array = []
    @array.each do |element|
      colors_array << element.color
    end
    colors_array
  end

  def return_type
    type_array = []
    @array.each do |element|
      type_array << element.type
    end
    type_array
  end


end
