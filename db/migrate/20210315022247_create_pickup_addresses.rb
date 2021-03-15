class CreatePickupAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :pickup_addresses do |t|
      t.string :address
      t.string :suburb
      t.integer :postcode
      t.string :state

      t.timestamps
    end
  end
end
