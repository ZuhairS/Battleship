class Board

  attr_reader :grid

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def count
    @grid.flatten.count(:s)
  end

  def empty?(pos = nil)
    return !@grid.flatten.include?(:s) if pos == nil
    self[pos] == nil
  end

  def full?
    !@grid.flatten.include?(nil)
  end

  def place_random_ship
    raise "Sorry, the board is full!" if full?
    pos = [rand(@grid.length), rand(@grid.length)]
    self[pos] = :s if empty?(pos)
  end

  def won?
    !@grid.flatten.include?(:s)
  end

  def display
    (0...10).each do |row|
      (0...10).each do |col|
        pos = [row, col]
        self[pos].nil? ? (print "   ") : (print " #{self[pos]} ")
        print "|" unless col == 10
      end
      puts "\n----------------------------------------" unless row == 10
    end
  end

  def populate_grid
    place_random_ship until count == 5
  end

end
