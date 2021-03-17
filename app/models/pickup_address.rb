class PickupAddress < ApplicationRecord
    has_many :items
    validates_presence_of :address,:suburb , :postcode,:state
    validates :postcode, format: { with: /\A(0[289][0-9]{2})|([1-9][0-9]{3})\z/ ,
      message: "unvalid postcode" }
    before_save :remove_whitespace 
    
    def remove_whitespace
        self.address=self.address.strip
        self.suburb=self.suburb.strip
        self.state=self.state.strip
       
      end  
end
