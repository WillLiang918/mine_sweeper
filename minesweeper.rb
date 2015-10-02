require_relative "board"

class MineSweeper

  def initialize(board = nil)
    @board = (board ||= Board.new)
  end

  def play
    until @board.game_over?
      @board.render
      do_action(get_pos, get_action)
    end
    board.dead ? puts("You're dead") : puts("You're not dead")
  end

  def get_action
    loop do
      puts 'Choose: reveal (r), toggle flag (f), save (s)'
      action = STDIN.gets.chomp
      return action if valid_action(action)
    end
  end

  def get_pos
    loop do
      puts 'Choose wisely, or die! ex: "1, 2"'
      guess_pos = STDIN.gets.chomp.split(',').map { |el| el.to_i }
      return guess_pos if valid_pos(guess_pos)
    end
  end

  def do_action(pos, action)
    tile = board[pos]
    tile.toggle_flag if action == "f"
    if action == "r"
      tile.reveal
      board.dead = true if tile.mine
    end
  end

  def valid_pos?(pos)
    !(@board[pos].nil? || @board[pos].revealed)
  end

  def valid_action?(action)
    action == "r" || action == "f"
  end
end
