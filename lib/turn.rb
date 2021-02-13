class Turn
  require './lib/codemaker'
  attr_reader :guess, :codemaker

  def initialize
    @codemaker = Codemaker.new
    @messages = Message.new
    @guess = nil
  end

  def user_input(user_guess)
    if user_guess == "q" || "Q" || "quit"
    @guess = user_guess.downcase.delete('^a-z')
    end
  end

  def index_and_color_guess_checker
    result = []
    4.times do |index|
      if code[index] == guess[index]
        result << "yes, index and color check out"
      else
        result << "no"
      end
    end
  end

  def color_guess_checker
    results = []
    4.times do |index|
      if guess.include?(access_code[index])
        results << "correct color, index not counted"
      else
        results << "wrong color, index not counted"
      end
    end
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

  def quit
    message.quit
  end
end
