
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string	:name,	null:false
      t.integer	:price,	null:false
      t.text	:description,	null:false
      t.string  :brand
      t.string  :condition,	null:false
      t.string  :deriver_charge,	null:false
      t.string  :area,	null:false
      t.string  :deriver_date,	null:false
      # t.references	:condition,	foreign_key:true
      # t.reference	category_id	foreign_key:true
      # t.reference	brand_id	foreign_key:true
      # t.reference	size_id	foreign_key:true
      # delivery_charge_id	reference	foreign_key:true
      # address_id	reference	foreign_key:true
      # delivery_dates_id	reference	foreign_key:true
      # order_status_id	reference	foreign_key:true
      t.string :name
      t.integer :price
      t.integer :order_id
      t.timestamps
    end
  end
end