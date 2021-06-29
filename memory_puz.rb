require_relative 'board'
require_relative 'card'

class Game 
    

    def initialize(guess_pos, length)
        @board = Board.new(length)
        @previous_guess = ""
        @successful_pos = []
        @guess_pos = guess_pos
    end

    def prev_reset
        @previous_guess = ""
    end

    def get_pos(string)
        puts 'Enter a guess position with a space between your numbers'
        pos = gets.chomp
        pos = pos.to_i.split(" ")
    end      

    

end