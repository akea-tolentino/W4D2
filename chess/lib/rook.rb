require_relative "slideable"
require_relative "piece"
require_relative "board"

class Rook < Piece

    include Slideable

    def move_dirs
        horizontal_dirs
    end
end
