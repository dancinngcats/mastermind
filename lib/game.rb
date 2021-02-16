class Game

  attr_reader :turn, :message

  def initialize
    @turn = Turn.new
    @message = Message.new
    @turn_number = 0
  end

  def start
    start_loop
  end

  def flow
    reset_game_scores
    @message.lets_play

    until @turn.has_won? || @turn_number == 100 || user_quits
      #establish time
      @turn.player_guess(gets.chomp)
      @turn_number += 1
      if user_quits
        @message.quit
        break
      end
      edge_case_for_loops

      if all_systems_go?
        reset_turn_score
        @turn.index_checker
        feedback_message
          if @turn.has_won?
            @time_end = Time.now
            end_game
            @user_input = gets.chomp
            if @user_input == "p"
              flow
            elsif @user_input == "q"
              @message.quit
              break
            end
          end
        end
      end
    end

    def edge_case_for_loops
      if @turn.guess == "c" || @turn.guess == "cheat"
        "*~*~*~*~* Cheater Cheater Pumpkin Eater *~*~*~*~*\n".each_char {|c| putc c ; sleep 0.1; $stdout.flush}
        puts "The computer's code is: #{@turn.access_code}"
      elsif @turn.correct_length? == -1
        @message.short_guess
      elsif @turn.correct_length? == 1
        @message.long_guess
      elsif @turn.correct_characters? == false
        @message.right_letters
      end
    end

  def all_systems_go?
    @turn.correct_characters? == true && @turn.correct_length? == true
  end

  def user_quits
    @turn.guess == "q" || @turn.guess == "Q" || @turn.guess ==  "quit"
  end

  def start_loop
    @user_input = gets.chomp.downcase
    # Play, quit or instructions
    start_menu_select
      # after instructions
      if @user_input == "i"
        until @user_input == "p" || @user_input == "q"
        @user_input = gets.chomp
          if @user_input == "p"
            flow
          elsif @user_input == "q"
            @message.quit
            break
          else
            @message.choose_play_or_quit
          end
        end
      end
    end

  def start_menu_select
    if @user_input == "p"
      flow
    elsif @user_input == "i"
      puts @message.instructions
    elsif @user_input == "q"
      @message.quit
    else
      @message.choose_play_or_quit
    end
  end

  def feedback_message
    "#{@turn.guess.to_s.upcase} has 4 correct colors in #{@turn.number_correct} of the correct positions. The number of guesses you've taken is #{@turn_number}.\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def end_game
    "Wonderful job! You guessed the sequence #{@turn.guess.upcase} in #{@turn_number} guesses over #{interpolated_time}. Come again! In fact, would you like to (p)lay again? Or (q)uit\n".each_char {|c| putc c ; sleep 0.015; $stdout.flush}
  end

  def end_conditions_are_met
    @turn_number == 100 || @turn.won == true
  end

  def reset_turn_score
    @turn.number_correct = 0
  end

  def time_elapsed
    time = @time_end - @time_start
  end

  def interpolated_time
    seconds = time_elapsed % 60
    minutes = (time_elapsed - seconds) / 60
    interpolated = "#{minutes.to_i} minutes and #{seconds.to_i} seconds"
  end


  def reset_game_scores
    @time_start = Time.now
    @turn.won = false
    @turn_number = 0
    @turn.number_correct = 0
    @turn = Turn.new
  end
end
