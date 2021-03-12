class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :customer_user , class_name:"User"
  belongs_to :owner_user , class_name:"User"
end
