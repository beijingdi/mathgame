require_relative './player'
class Game
  def initialize
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @players = [@player2, @player1]
  end

  def ask_answer
    @players.rotate!
    puts "enter first number"
    num1 = gets.chomp
    puts "first number is #{num1}"
    puts "enter second number"
    num2 = gets.chomp
    puts "#{@players[0].name}: how much is #{num1} + #{num2} ?"
    answer = gets.chomp
    if answer.to_i == num1.to_i + num2.to_i
      puts "Yes! You are correct."
    else
      puts "Seriously? No."  
      @players[1].lives -= 1
    end
  end

  def game_over?
    @player1.loser? || @player2.loser?
  end

  def display_winner
    loser = @players.detect{|player| player.loser?}
    if loser.name == "player1"
      puts "the Winner is player2"
    else 
      puts "the Winner is player1"
    end
  end

  def display_game_status
    @players.each {|player| puts "#{player.name} Lives: #{player.lives}"}
  end
  
  def play
    until (game_over? == true) do
      ask_answer
      display_game_status
    end
    display_winner
  end

end