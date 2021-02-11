class Turn
  require './lib/codemaker'
  attr_reader :guess

  def initialize
    @code = Codemaker.new
    @guess = nil
  end

  def user_input(user_guess)
    @guess = user_guess
    # .tr('a-z', '')
  end

  def guess_checker
    return sorry_message if @guess.length != 4
    # return sorry_message if @guess.include?("[0..9]")
  end
#
  def sanitize
#     # find a ruby method to remove spaces and characters
#     # guess.lowercase.delete(/[$-/:-?{-~!"^_`\[\]]/)
#
#     def canonical_form str
#   str.tr('^0-9', '')
# end
#
#     @guess = @guess.downcase.delete "123456789"
  end
#
  def sorry_message
    "Nah try again"
  end
#
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
