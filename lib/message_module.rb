module MessageModule

  def slow_it_down(msg, speed)
    msg.each_char {|c| putc c ; sleep (speed); $stdout.flush}
  end

  def break_it_up
    puts "-" * 100
  end

  def introduction
    slow_it_down("Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n", 0.015)
    # break_it_up
  end

  def quit
    slow_it_down("We are sorry to see you go... Come again. Or not.\n", 0.015)
  end

  def instructions
    "Mastermind - Rules of the game.\n\nThe computer picks a sequence of four colors.\n\nThe number of colors is the code length.\n\nThe objective of the game is to guess the exact positions of the colors in the computer's sequence. By default, a color can be used only once in a code sequence.\n\nAfter filling a line with your guesses, the computer responses with the result of your guess.\n\nFor each color in your guess that is in the correct color and correct position in the code sequence, the computer will return 'a correct element is in correct position'.\n\nYou win the game when you manage to guess all the colors in the code sequence and when they all in the right position.\n\nYou lose the game if you use all 100 attempts without guessing the computer code sequence.\n\nWould you like to (p)lay or (q)uit?\n"
  end

  def lets_play
    slow_it_down("I have generated a beginner sequence with four elements made up of: red, green, blue, and yellow.\n\nUse (q)uit at any time to end the game. What's your guess?\n", 0.015)
  end

  def choose_play_or_quit
    slow_it_down("You are not making any sense... Make a choice from proposed options\n", 0.015)
  end

  def short_guess
    slow_it_down("Your guess does not have enough characters... Pay attention and try again.\n", 0.015)
  end

  def long_guess
    slow_it_down("C'mon... Your guess has too many characters. Try again.\n", 0.015)
  end

  def right_letters
    slow_it_down("You are not using correct characters... Use first letters from corresponding colors: (r)ed, (y)ellow, (b)lue, or (g)reen. Let's try again!\n", 0.015)
  end

  def cheater
    slow_it_down("*~*~*~*~* Cheater Cheater Pumpkin Eater *~*~*~*~*\n", 0.1)
  end

  def cheater_2
    slow_it_down("The computer's code is: #{@turn.access_code}\n", 0.0)
  end

  def feedback_message
    slow_it_down("#{@turn.guess.to_s.upcase} has 4 correct colors in #{@turn.number_correct} of the correct positions. The number of guesses you've taken is #{@turn_number}.\n", 0.015)
  end

  def end_game
    slow_it_down("Wonderful job! You guessed the sequence #{@turn.guess.upcase} in #{@turn_number} guesses over #{interpolated_time}. Come again!\nIn fact, would you like to (p)lay again? Or (q)uit\n", 0.015)
  end
end
