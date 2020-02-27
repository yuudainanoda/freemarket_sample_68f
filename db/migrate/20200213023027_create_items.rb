
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string	:name,	          null:false
      t.integer	:price,	          null:false
      t.string  :brand
      t.text	  :description,	    null:false
      t.integer :condition_id,	  null:false
      t.integer :deriver_charge_id,	null:false
      t.integer :prefecture_id,	  null:false
      t.integer :deriver_date_id,	  null:false
      t.integer :soldout_or_exhibiting_id, default: 1
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

      t.timestamps
    end
  end
end