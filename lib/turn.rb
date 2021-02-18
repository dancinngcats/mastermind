require './lib/codemaker'

class Turn
  attr_reader :guess, :codemaker
  attr_accessor :number_correct, :won

  def initialize
    @codemaker = Codemaker.new
    @guess = nil
    @won = false
    @number_correct = 0
  end

  def player_guess(answer)
    @guess = answer.downcase
  end

  def correct_characters?
    !@guess.match?(/[^"r", "g", "b", "y"]/)
  end

  def index_checker
    4.times do |index|
      @number_correct += 1 if @codemaker.code == @guess[index]
    end
  end

  def correct_length?
    if @guess.length > 4
      1
    elsif @guess.length < 4
      -1
    else
      true
    end
  end

  def has_won?
    @won = true if @number_correct == 4
  end
end
