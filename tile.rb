class Tile

  def initialize(board, mine = false)
    @mine = mine
    @flagged = false
    @revealed = false
    @board = board
  end

  #new arr = bomb_count [true]

  def reveal
    @revealed = true
  end

  def neighbors
  end

end
