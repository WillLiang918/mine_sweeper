class Tile
  DELTAS = [
    [0, 1],
    [1, 1],
    [0, 1],
    [-1, 1],
    [-1, 0],
    [-1, -1],
    [-1, 0],
    [1, -1]
  ]


  def initialize(board, tile_pos, mine = false)
    @mine = mine
    @flagged = false
    @revealed = false
    @board = board
    @tile_pos = tile_pos
  end

  def reveal
    @revealed = true
    
  end

  def neighbors
    tile_x, tile_y = tile_pos
    result = []

    DELTAS.map do |delta|
      delta_x, delta_y = delta
      x = tile_x + delta_x
      y = tile_y + delta_y
      pos = [x, y]
      result << pos if pos.all? { |el| el.between?(0..board.dim) }
    end

    result
  end

  def neighbors_mine_count
    neighbors.select { |tiles| tiles.mine }.count
  end

  def inspect
    "{tile_pos: @tile_pos, mine: @mine, flagged: @flagged, revealed: @revealed}"
  end

  def toggle_flag
    @flagged = !@flagged
  end

end
