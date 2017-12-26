class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.references :auction, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :card_number
      t.integer :product_received
      t.integer :status
      t.integer :total_amount

      t.timestamps
    end
  end
end
