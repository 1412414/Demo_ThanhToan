class CreateFavoriteLists < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_lists, id: false do |t|
      t.references :customer, foreign_key: true
      t.references :auction, foreign_key: true

      t.timestamps
    end

    execute "ALTER TABLE favorite_lists ADD PRIMARY KEY (customer_id, auction_id);"
  end
end
