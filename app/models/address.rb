class Address < ApplicationRecord
  belongs_to :user

  

  def not_empty?
    if self.address? && self.suburb? && self.postcode? && self.state?
      return true
    else
      return false 
    end   
  end
end
