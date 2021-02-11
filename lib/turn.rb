class Turn
  require './lib/codemaker'

  def initialize
    @code = Codemaker.new
    @guess = nil
  end

  def user_input
    puts "What is your guess"
    @guess = gets.chomp
  end

  def guess_checker(guess)
    return sorry_message if guess.length != 4
  end

  def sanitize(guess)
    # find a ruby method to remove spaces and characters
    guess.lowercase.delete(" ")
  end

  def sorry_message
    "Nah try again"
  end

  def compare_input
    # @codemaker_code ==
    puts @code.codemaker_code
    sanitize(guess) == @code.codemaker_code.to_s

  end



# 2. eval method - compare guess

# 3. return feedback

# keep track of time

# keep track of guesses

end
