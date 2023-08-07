class Chessboard
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def within_bounds?(x, y)
    x.between?(0, size - 1) && y.between?(0, size - 1)
  end
end
