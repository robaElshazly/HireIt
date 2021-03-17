class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :owner_user, null: false
      t.references :customer_user, null: false
      #t.integer :owner_user_id, null: false
      #t.integer :customer_user_id, null: false
      t.references :item, null: false, foreign_key: true

      #t.foreign_key :users, column: :owner_user_id
      #t.foreign_key :users, column: :customer_user_id
      
      t.timestamps null: false
    end
     add_foreign_key :bookings, :users, column: :owner_user_id
     add_foreign_key :bookings, :users, column: :customer_user_id
  end
end
