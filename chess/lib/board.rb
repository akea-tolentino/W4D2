require_relative "piece"
require_relative 'null_piece'
require 'byebug'

class Board 
    
    attr_reader :grid, :null_piece
    def initialize
        @null_piece = NullPiece.instance
        @grid = Array.new(8) {Array.new(8, @null_piece)}
        
    end

    def populate_white_piece
        @grid[0].map! {|piece| Piece.new("piece")}
        @grid[1].map! {|piece| Piece.new("piece")}
        @grid[6].map! {|piece| Piece.new("piece")}
        @grid[7].map! {|piece| Piece.new("piece")}
        @grid 
    end

    def populate_black_piece
        @grid[0].map! {|piece| Piece.new("piece")}
        @grid[1].map! {|piece| Piece.new("piece")}
        @grid[6].map! {|piece| Piece.new("piece")}
        @grid[7].map! {|piece| Piece.new("piece")}
        @grid 
    end

    def [](pos)
        row, col = pos 
        @grid[row][col]
    end 

    def []=(pos, symbol)
        row, col = pos 
        @grid[row][col] = symbol
    end 
    
    def move_piece(start_pos, end_pos)
        if self[start_pos] == NullPiece.instance
            raise "no piece to move"
        end 

        if !self[end_pos] == NullPiece.instance
            raise "pos already occupied"
        end 

        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance 

    end 


end 