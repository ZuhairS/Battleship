require_relative 'board.rb'
require_relative 'player.rb'

class BattleshipGame
  attr_reader :player, :board

  def initialize(player, board)
    @board = board
    @player = player
  end

  def attack(pos)
    @board[pos] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    attack(@player.get_play)
  end

  def display
    @board.display
  end

  def setup
    @board.populate_grid
  end

  def play
    puts "Thank you for playing Battleship: The Game"
    setup
    display
    until game_over?
      play_turn
      display
    end
    puts "\nWell done! You destroyed all the ships!\n"
  end

end

if __FILE__ == $PROGRAM_NAME
  player = HumanPlayer.new("Zuhair")
  board = Board.new
  new_game = BattleshipGame.new(player, board)
  new_game.play
end
