class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :ending_time
      t.string :starting_time
      t.integer :starting_price
      t.integer :current_price
      t.integer :max_price
      t.integer :buy_it_now_price
      t.integer :bid_increment
      t.integer :status
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
