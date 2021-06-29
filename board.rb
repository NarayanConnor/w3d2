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
               #debugger
                @grid[i][j] = random_card
            end 
        end 
        
    end

    def random_card
        full_deck=(@deck_half+@deck_half).shuffle
        return full_deck.pop
    end




end