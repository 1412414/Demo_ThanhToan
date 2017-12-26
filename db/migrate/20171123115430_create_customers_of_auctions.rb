class CreateCustomersOfAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :customers_of_auctions do |t|
      	t.references :auction, foreign_key: true
      	t.references :customer, foreign_key: true
      	t.integer :max_bid_amount
      	t.timestamps
    end
  end
end
