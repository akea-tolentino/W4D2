module Slideable 
    HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end 

    def diagonal_dirs
        DIAGONAL_DIRS
    end 

    def moves 
        potential_pos = []
        directions = self.move_dirs

        directions.each do |dir|
           potential_pos << grow_unblocked_moves_in_dir(dir)
        end 

        potential_pos
    end

    def grow_unblocked_moves_in_dir(dir)
        dx, dy = dir
        cx, cy = self.pos
        curr_pos = self.pos 
       
        moves_in_dir = []
        next_pos = [cx + dx, cy + dy]

        if on_board?(next_pos)
            curr_pos = next_pos
            moves_in_dir << next_pos
        end 

        while on_board?(curr_pos) && (board[curr_pos] == self.board.null_piece || board[curr_pos].color != self.color)
            
            break if self.board[curr_pos].color != self.color && board[curr_pos] != self.board.null_piece

            cx, cy = cx + dx, cy + dy
            new_pos = [cx, cy]
            moves_in_dir << curr_pos if !moves_in_dir.include?(curr_pos)
            curr_pos = new_pos
        end

        moves_in_dir << curr_pos if on_board?(curr_pos) && curr_pos != self.board.null_piece && self.color != self.board[curr_pos].color
        
        moves_in_dir
    end

    def on_board?(pos)
        row, col = pos

        return false if !(0..7).to_a.include?(row)
        return false if !(0..7).to_a.include?(col)
        true
    
    end
end