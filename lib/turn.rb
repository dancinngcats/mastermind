require './lib/codemaker'
require './lib/message'

class Turn
  attr_reader :guess, :codemaker, :won

  def initialize
    @codemaker = Codemaker.new
    @message = Message.new
    @guess = nil
    @won = false
  end

  def user_input(answer)
    sanitized = answer.downcase.delete('^a-z')
    @guess = sanitized.split('')
  end

  def index_checker
    result = []
    4.times do |index|
      if access_code[index] == @guess[index]
        result << 1
      else
        result << 0
      end
    end
    result.sum
  end

  def color_checker
    result = []
    4.times do |index|
      if guess.include?(access_code[index])
        result << 1
      else
        result << 0
      end
    end
    result.sum
  end

  def length_message
    if @guess.length > 4
      puts @message.long_guess
      @guess = nil
    elsif @guess.length < 4
      puts @message.short_guess
      @guess = nil
    end
  end

  def has_won?
    @won = true if @guess == access_code
  end

  def access_code
    @codemaker.code
  end
end
