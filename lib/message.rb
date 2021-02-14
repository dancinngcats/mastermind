class Message
  attr_reader :codemaker
  def intialize
    @codemaker = Codemaker.new
  end

def introduction
  "Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
end

def quit
  "We are sorry to see you go... Come again. Or not."
end

def instructions
  "Here are the instructions: .............Would you like to (p)lay or (q)uit?"
end

def lets_play
  "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
end

def abracadabra
  "Naughty-naughty (you answered incorrectly) Give it another shot."
end

def cheat
  "Okay, we will help. Here is your cheat code:"
end

def short_guess
  "Your guess does not have enough characters... Pay attention and try again."
end

def long_guess
  "C'mon... Your guess has too many characters. Try again."
end

def end_game
  "Wonderful job! Did you have fun? We know you did. Come again. In fact, would you like to (p)lay again? Or (q)uit"
end

def input_format
  shuffled_code = @codemaker.code.sort
  "Please use the format requested. The only characters you are able to use are English letters used in the array: #{@shuffled_code}."
end

def right_letters
  "You are not using correct characters... Not sure why. Let's try again"
end


end
