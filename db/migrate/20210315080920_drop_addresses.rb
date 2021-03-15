class DropAddresses < ActiveRecord::Migration[6.1]
  def change
    drop_table :addresses do |t|
      t.string :address 
      t.string :suburb
      t.integer :postcode
      t.string :state
      t.references :user, null: false, foreign_key: true
      t.timestamps null: false
    end  
  end
end
