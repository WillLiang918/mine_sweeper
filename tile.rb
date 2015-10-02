require "byebug"
class Tile
  DELTAS = [
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1],
    [-1, 0],
    [-1, 1]
  ]

  attr_reader :mine, :flagged, :tile_pos
  attr_accessor :revealed

  def initialize(board, tile_pos, mine = false)
    @mine = mine
    @flagged = false
    @revealed = false
    @board = board
    @tile_pos = tile_pos
  end

  def reveal
    return if @revealed
    @revealed = true
    children = neighbors
    unless neighbors_mine_count > 0
      children.each { |child| child.reveal }
    end
  end

  def neighbors
    tile_x, tile_y = @tile_pos
    result = []

    DELTAS.map do |delta|
      delta_x, delta_y = delta
      x = tile_x + delta_x
      y = tile_y + delta_y
      pos = [x, y]
      result << @board[pos] if pos.all? { |el| el.between?(0, @board.dim - 1) }
    end

    result
  end

  def neighbors_mine_count
    neighbors.select { |tile| tile.mine }.count
  end

  def inspect
   "tile_pos: #{@tile_pos}, mine: #{@mine}, flagged: #{@flagged}, revealed: #{@revealed}}"
  end

  def toggle_flag
    @flagged = !@flagged
  end
end
