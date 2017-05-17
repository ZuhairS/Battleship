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

  def play

  end

end

if __FILE__ == $PROGRAM_NAME
  
end
