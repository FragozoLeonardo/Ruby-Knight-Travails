require_relative 'chessboard'
require_relative 'knight'

def display_path(path)
  if path.nil?
    puts "The knight cannot reach the target square!"
  else
    puts "You made it in #{path.length - 1} move(s)! Here's your path:"
    path.each { |square| puts square.inspect }
  end
end

def knight_moves(start, target)
  board = Chessboard.new(8)
  knight = Knight.new(board)
  path = knight.knight_moves(start, target)
  display_path(path)
end

# Test cases
knight_moves([0, 0], [1, 2])
knight_moves([0, 0], [3, 3])
knight_moves([3, 3], [0, 0])
knight_moves([3, 3], [4, 3])
