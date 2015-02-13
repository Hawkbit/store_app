class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productCode
      t.string :productName
      t.string :productLine
      t.string :productScale
      t.string :productVendor
      t.text :productDescription
      t.integer :quantityInStock
      t.float :buyPrice
      t.float :MSRP

      t.timestamps
    end
  end
end
