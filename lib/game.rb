class Game

  attr_reader :turn

  include Message

  def initialize
    @turn = Turn.new
    @turn_number = 0
  end

  def start
    introduction
    start_loop
  end

  def flow
    reset_game_scores
    lets_play

    until @turn.has_won? || @turn_number == 100 || user_quits
      #establish time
      @turn.player_guess(gets.chomp)
      @turn_number += 1
      if user_quits
        quit
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
              quit
              break
            end
          end
        end
      end
    end

    def edge_case_for_loops
      if @turn.guess == "c" || @turn.guess == "cheat"
        cheater
        cheater_2
      elsif @turn.correct_length? == -1
        short_guess
      elsif @turn.correct_length? == 1
        long_guess
      elsif @turn.correct_characters? == false
        right_letters
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
            quit
            break
          else
            choose_play_or_quit
          end
        end
      end
    end

  def start_menu_select
    if @user_input == "p"
      flow
    elsif @user_input == "i"
      puts instructions
    elsif @user_input == "q"
      quit
    else
      choose_play_or_quit
    end
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
