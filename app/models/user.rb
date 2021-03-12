class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true 
  has_many :items
  has_one :address, dependent: :destroy
  has_many :booked_for_me, class_name:"Booking" , foreign_key: "customer_user_id"
  has_many :Booked_from_me, class_name:"Booking" , foreign_key: "owner_user_id"
  accepts_nested_attributes_for :address
end
