class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :customer_type
      t.string :address
      t.string :shipping_address
      t.integer :negative_points
      t.integer :positive_points
      t.string :total_transactions
      t.references :blocker, index: true, foreign_key: { to_table: :employees }
      t.string :blocking_time
      t.integer :number_of_created_products_in_a_month
      t.string :paypal

      t.timestamps
    end
  end
end
