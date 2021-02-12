class Codebreaker

  def initialize
    @pegs = []
  end

  def pegs
    @pegs
  end

  def add_peg(peg)
    @pegs << peg
  end

  def return_colors
    @pegs.map do |peg|
      peg.color
    end
  end
end
