class Knight
  attr_reader :board

  MOVES = [
    [-2, -1], [-2, 1], [2, -1], [2, 1],
    [-1, -2], [-1, 2], [1, -2], [1, 2]
  ].freeze

  def initialize(board)
    @board = board
  end

  def knight_moves(start, target)
    return [start] if start == target

    visited = {}
    queue = [[start]]

    while !queue.empty?
      path = queue.shift
      current_position = path.last

      return path if current_position == target

      next_moves = possible_moves(current_position)
      next_moves.each do |move|
        next_position = [current_position[0] + move[0], current_position[1] + move[1]]

        if board.within_bounds?(next_position[0], next_position[1]) && !visited[next_position]
          visited[next_position] = true
          new_path = path + [next_position]
          queue << new_path
        end
      end
    end
  end

  private

  def possible_moves(position)
    MOVES.map { |move| [move[0] + position[0], move[1] + position[1]] }
  end
end
