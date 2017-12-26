class CreateProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_types do |t|
      t.string :product_type_name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
