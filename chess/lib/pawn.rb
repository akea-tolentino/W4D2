class Pawn < Piece

    def moves
        
    end

    private
    
    def at_start_row?
        return true if @count == 0
        false
    end

    def forward_dir
        if self.color == :white
            return [1, 0]
        else
            return [-1, 0]
        end
    end

    def forward_steps
        @count = 0
    end

    def side_attacks

        #would add potential moves to moves array,
        #if pieces of opposite color are [1, 1] or [1, -1]
    end
end