require_relative "tile"

class Board
  attr_reader :mines_count, :grid, :dim

  def initialize(dim = 10)
    @dim = dim
    @mines_count = dim
    @grid = Array.new(dim) {Array.new(dim)}
    @dead = false
    place_mines
  end

  def place_mines
    mines_arr = [ true ] * mines_count
    remaining_tiles = dim ** 2 - mines_count

    mines_arr += [false] * remaining_tiles
    mines_arr.shuffle

    (0...dim).each do |row|
      (0...dim).each do |col|
        self[[row, col]] = Tile.new(self, [row, col], mines_arr.pop)
      end
    end
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x,y = pos
    grid[x][y] = value
  end

  def game_over?
    win? || @dead
  end

  def win?
    grid.flatten.all? do |tile|
      tile.mine && tile.flagged || !tile.mine && tile.revealed
    end
  end

  def render
    puts "   #{(0...dim).to_a.join(" ")}"
    @grid.each_with_index do |row, idx|
      line = "#{idx} "
      row.each do |tile|
        if tile.flagged
          line.concat(" F")
        elsif tile.revealed
          num = tile.neighbors_mine_count
          str = ( num == 0 ? " _" : " #{num}" )
          line.concat(str)
        elsif tile.mine && tile.revealed
          line.concat(" X")
        else
          line.concat(" *")
        end
      end
      puts line
    end
  end



end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.place_mines
end
