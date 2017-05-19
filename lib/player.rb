class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_play
    print "\nPlease enter the coordinates you want to attack"
    print " on the 10x10 grid (eg. 0 0, 4 8): \n"
    attack_pos = gets.chomp.split.map(&:to_i)
    if in_range?(attack_pos)
      attack_pos
    else
      puts "\n\nInvalid coordinates! Try again.\n"
      get_play
    end
  end

  def in_range?(pos)
    pos.max < 10 && pos.min >= 0
  end

end
