require 'singleton'

class NullPiece < Piece
    include Singleton  

    attr_reader :color, :symbol

    def initialize
        @color = color
        @symbol = symbol
    end

end