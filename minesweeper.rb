require_relative "board"

class MineSweeper

  def initialize(board = nil)
    @board = (board ||= Board.new)
  end

  def guess_spot

  end

  def get_pos
    puts 'Choose wisely, or die! ex: "1, 2"'
    STDIN.gets.chomp.split(',').map { |el| el.to_i }
  end

  def get_action
    puts 'Choose: reveal (r), flag (f), save (s)'
    STDIN.gets.chomp
  end

  def valid_pos?(pos)
    !@board[pos].nil?
  end

  def valid_action?(action)
    action == "r" || action == "f"
  end



end
