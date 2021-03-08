class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture

  #Search items query
  def self.search(search_params) 
    return all if search_params.blank?
    where('LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)', "%#{search_params}%","%#{search_params}%")
  end
end
