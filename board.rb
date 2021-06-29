require "byebug"
require_relative "card"

class Board


    

    def initialize(length)
        @alpha = ("a".."z").to_a
        @grid=Array.new(length){Array.new(length,' ') }
        @deck_half= self.fill_deck 
        @card= ''
        
            
        # @count= (length*length) / 2
        
        @other_half = []
        
    end

    def [](pos)
        row,column=pos
        @grid[row][column]
    end

    def new_card 
        face_value = @alpha.sample 
        @alpha.delete(face_value)
        @card = Card.new(face_value)
        @card 
    end

    def fill_deck 
        game = []
        count = (@grid.length * @grid.length) / 2  
        # debugger
        count.times { game << self.new_card }
        game 
    end



    def populate
        @grid.each_with_index do |row, i|
            row.each_with_index do |column, j|
               # pos= row,column # removed brackets
                @grid[i][j] = random_card
            end 
        end 
        
    end

    def random_card
        used_card = @deck_half.sample 
        @deck_half.delete(used_card)
        @other_half << used_card 
        
        if @deck_half.empty? 
            pair = @other_half.sample 
            @other_half.delete(pair)
            return pair 
        end     

        used_card 
    end




end