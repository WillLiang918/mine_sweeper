require_relative "tile"

class Board
  def initialize(dim = 10)
    @dim = dim
    @mine_count = dim
    @grid = Array.new(dim) {Array.new(dim)}
  end

  def place_mines
    testp
  end

end
