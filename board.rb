class Board


    ALPHA=('a'..'z').to_a

    def initialize(length)
        @grid=Array.new(length){Array.new(length,' '}
        @deck_half=[]
        @card=Card.new(ALPHA.sample)
        @count=length**2/2
        @count.times { @deck_half<<@card}
        

    end

    def [](pos)
        row,column=pos
        @grid[row][column]
    end

    


    def populate
        @grid.each do |row|
            row.each do |column|
                pos=[row,column]
                @grid[pos]



    end






end