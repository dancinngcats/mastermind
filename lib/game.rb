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
    p @message.lets_play

    until @turn.has_won? || @turn_number == 100 || user_quits

      @turn.player_guess(gets.chomp)
      @turn_number += 1
      if user_quits
        p @message.quit
        break
      end
      edge_case_for_loops

      if all_systems_go?
        reset_turn_score
        @turn.index_checker
        p feedback_message
          if @turn.has_won?
            p @message.end_game
            @user_input = gets.chomp
            if @user_input == "p"
              flow
            elsif @user_input == "q"
              p @message.quit
              break
            end
          end
        end
      end
    end

    def edge_case_for_loops
      p @message.short_guess if @turn.correct_length? == -1
      p @message.long_guess if @turn.correct_length? == 1
      p @message.abracadabra if @turn.correct_characters? == false
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
            puts @message.quit
            break
          else
            puts @message.abracadabra
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
      puts @message.quit
    else
      puts @message.abracadabra
    end
  end

  def feedback_message
    "#{@turn.guess.to_s.upcase} has 4 correct colors in #{@turn.number_correct} of the correct positions. The number of guesses you've taken is #{@turn_number}."
  end

  def end_conditions_are_met
    @turn_number == 100 || @turn.won == true
  end

  def reset_turn_score
    @turn.number_correct = 0
  end

  def reset_game_scores
    @turn.won = false
    @turn_number = 0
    @turn.number_correct = 0
  end
end
