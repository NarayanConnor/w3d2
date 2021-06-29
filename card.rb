class Card

    def initialize(face) 
        @face_value = face  #boolean
        @face_down = true 
    end

    def hide
        if !@face_down 
            @face_down = true 
        else  
            @face_down = false 
        end 
    end

    def reveal
        @face_value 
    end

    def to_s
        @face_value.to_s 
    end

    # def ==(card)
    #     self.face_value == card.face_value 
    # end
end