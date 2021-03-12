class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture
  validates_presence_of :name, :price 
  #scope :recent_first, -> {order(created_at: :desc)}
  #Search items query
  def self.search(search_params) 
    return all if search_params.blank?
    where('LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)', "%#{search_params}%","%#{search_params}%")
  end
end
