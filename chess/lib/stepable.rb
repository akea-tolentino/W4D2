
module Stepable

    def moves
        moves = []

        move_diffs.each do |move_diff|
            dx, dy = move_diff
            cx , cy = pos 
            new_pos = [cx + dx, cy + dy]
            if on_board?(new_pos) && (board[new_pos].nil? || board[new_pos].color != self.color)
                moves << new_pos
            end 
        end 
        moves 


    end

    def on_board?(pos)
        row, col = pos

        return false if !(0..7).to_a.include?(row)
        return false if !(0..7).to_a.include?(col)
        true
    end

end