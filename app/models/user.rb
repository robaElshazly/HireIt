class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true 
  has_many :item
  has_many :booked_for_me, class_name:"Booking" , foreign_key: "customer_user_id"
  has_many :Booked_from_me, class_name:"Booking" , foreign_key: "owner_user_id"
  
end
