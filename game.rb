class Game
  def initialize
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @current_player_index = 0
  end

  def next_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def start
    loop do
      current_player = @players[@current_player_index]
      question = Question.new

      puts "#{current_player.name}: #{question.text}"
      player_answer = gets.chomp.to_i

      if question.correct_answer?(player_answer)
        puts "#{current_player.name}: YES! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end

      display_scores
      break if game_over?

      puts "---- NEW TURN ----"
      next_player
    end

    display_winner
    puts "GAME OVER -_"
    puts "Goodbye!"
  end

  def game_over?
    @players.any? { |player| player.life <= 0 }
  end

  def display_scores
    puts "P1: #{@players[0].life}/3 vs P2: #{@players[1].life}/3"
  end

  def display_winner
    winner = @players.find { |player| player.life > 0 }
    loser = @players.find { |player| player != winner }
    puts "#{winner.name} wins with a score of #{winner.life}/3"
    puts "#{loser.name}'s score is #{loser.life}/3"
  end
end
