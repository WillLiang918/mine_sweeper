require_relative "board"

class Game

  def initialize(board = nil)
    @board = (board ||= Board.new)
  end

  def guess_spot

  end

  def get_pos
    puts 'Choose wisely, or die! ex: "1, 2"'
    STDIN.gets.chomp.split(',').map { |el| el.to_i }
  end

  def valid_pos?(input)
    # 1, 3

  end

  def valid_




end
