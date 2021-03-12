class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :owner_user_id, null: false
      t.integer :customer_user_id, null: false
      t.references :item, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
