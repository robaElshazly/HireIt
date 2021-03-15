class AddPickupAddressRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :pickup_address, null: false, foreign_key: true
  end
end
