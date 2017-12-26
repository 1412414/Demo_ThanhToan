class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.references :product_type, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
