class Turn
  require './lib/codemaker'
  attr_reader :guess, :codemaker

  def initialize
    @codemaker = Codemaker.new
    @messages = Message.new
    @guess = nil
  end

  def user_input(user_guess)
    @guess = user_guess.downcase.delete('^a-z')
  end

  def guess_checker
    return sorry_message
  end

  def sorry_message
    if @guess.length > 4
      @message.feedback
    elsif @guess.length < 4
      @message.feedback
    end
  end
#
  def has_won?
    @guess == access_code.join()
  end

  def access_code
    @codemaker.code
  end

end
