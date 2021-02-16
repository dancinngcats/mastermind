class Message

  def introduction
    "Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def quit
    "We are sorry to see you go... Come again. Or not.\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def instructions
    "Mastermind - Rules of the game.\n\nThe computer picks a sequence of four colors.\n\nThe number of colors is the code length.\n\nThe objective of the game is to guess the exact positions of the colors in the computer's sequence. By default, a color can be used only once in a code sequence.\n\nAfter filling a line with your guesses, the computer responses with the result of your guess.\n\nFor each color in your guess that is in the correct color and correct position in the code sequence, the computer will return 'a correct element is in correct position'.\n\nYou win the game when you manage to guess all the colors in the code sequence and when they all in the right position.\n\nYou lose the game if you use all 100 attempts without guessing the computer code sequence.\n\nWould you like to (p)lay or (q)uit?\n"
  end

  def lets_play
    "I have generated a beginner sequence with four elements made up of: red, green, blue, and yellow.\n\nUse (q)uit at any time to end the game. What's your guess?\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def choose_play_or_quit
    "You are not making any sense... Make a choice from proposed options\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def short_guess
    "Your guess does not have enough characters... Pay attention and try again.\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def long_guess
    "C'mon... Your guess has too many characters. Try again.\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def right_letters
    "You are not using correct characters... Use first letters from corresponding colors: (r)ed, (y)ellow, (b)lue, or (g)reen. Let's try again!\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

end
