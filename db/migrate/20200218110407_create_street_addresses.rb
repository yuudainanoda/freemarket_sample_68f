class CreateStreetAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :street_addresses do |t|
      t.string       :prefecture,  null:false
      t.string       :city,        null:false
      t.string       :address,     null:false
      t.string       :building
      t.integer      :zipcode,     null:false
      t.timestamps
    end
  end
end
