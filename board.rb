require "byebug"
require_relative "card"

class Board


    

    def initialize(length)
        @alpha = ("a".."z").to_a
        @grid=Array.new(length){Array.new(length,' ') }
        @card= ''
        @pairs = self.make_alphas_pair

        @i = 0

        
            
        # @count= (length*length) / 2
        
     
        
    end

    def [](pos)
        row,column=pos
        @grid[row][column]
    end


    def make_alphas_pair
        pairs = []
        count = (@grid.length * @grid.length) / 2 

        count.times do 
            letter = @alpha.sample
            pairs << letter 
            pairs << letter 
            @alpha.delete(letter)
        end 

        pairs.map! { |letter| Card.new(letter) }

    end

    # def fill_deck 
    #     game = []
         
    #     # debugger
    #     count.times { game << self.new_card }
    #     game 
    # end



    def populate
        @grid.each_with_index do |row, i|
            row.each_with_index do |column, j|
               # pos= row,column # removed brackets
               #debugger
               p random_card
                @grid[i][j] = random_card 
            end 
        end 
        
    end

    #<Card:0x00007f9853c78970 @face_value="d", @face_down=true>
    #<Card:0x00007f9853c789c0 @face_value="m", @face_down=true>
    #<Card:0x00007f9853c789e8 @face_value="m", @face_down=true>


    def random_card
        # debugger 
        # random = @pairs.shuffle
        pairs = @pairs[@i]
         @i += 1
        pairs 
    end


    def render
        face_down_cards = @grid.flatten 

        rendered = Array.new(@grid.length) { Array.new(@grid.length, "") }
        i = 0
        rendered.map do |row|
             row.map do |ele|          
                ele = face_down_cards[i] ? " " : face_down_cards[i].face_value
                i += 1
             end
        end 
        rendered.each { |row| print row }
    end

    def won?
        render.all? { |ele| ele.face_down == false }
    end

    def reveal(pos)
        @grid[pos[0]][pos[1]].reveal 
        return @grid[pos[0]][pos[1]].face_value
    end


end