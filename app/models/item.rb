class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :pickup_address
  accepts_nested_attributes_for :pickup_address
  has_one_attached :picture
  has_many :bookings, dependent: :destroy
  validates_presence_of :name, :price 
  validates_associated :pickup_address
  
  before_save :remove_whitespace 
  scope :recent_first, -> {order(created_at: :desc)}
  #Search items query to find all itemsincluding the searched key in there names or description
  def self.search(search_params) 
    return all if search_params.blank?
    where('LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)', "%#{search_params}%","%#{search_params}%")
  end

  def remove_whitespace
    self.name=self.name.strip
    self.description=self.description.strip
  end  

  def unavailable_dates
    Date::DATE_FORMATS[:range_format] = '%Y-%M-%D'
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0].to_formatted_s(:range_format), to: range[1].to_formatted_s(:range_format) }
    end
  end  
end
