require_relative "tile"

class Board
  def initialize(dim = 10)
    @dim = dim
    @mine_count = dim
    @grid = Array.new(dim) {Array.new(dim)}
  end

  def place_mines
    mines_arr = mine_count * [ true ]
    remaining_tiles = dim ** 2 - mines_arr

    mines_arr += remaining_tiles * [false]
    mines_arr.shuffle

    (0...dim).each do |row|
      (0...dim).each do |col|
        self[row, col] = Tile.new(self, [row, col], mines_arr.pop)
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value
  end

  def game_over?
    won? || die?
  end

end
