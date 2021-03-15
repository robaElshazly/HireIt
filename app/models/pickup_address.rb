class PickupAddress < ApplicationRecord
    has_many :items
    validates_presence_of :address,:suburb , :postcode,:state
    before_save :remove_whitespace 
    
    def remove_whitespace
        self.address=self.address.strip
        self.suburb=self.suburb.strip
        self.state=self.state.strip
       
      end  
end
