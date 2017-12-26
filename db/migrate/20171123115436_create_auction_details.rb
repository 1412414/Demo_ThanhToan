class CreateAuctionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :auction_details do |t|     
      t.references :customers_of_auction, foreign_key: true
      t.string :bid_time
      t.integer :bid_amount
      t.integer :status

      t.timestamps
    end
  end
end
