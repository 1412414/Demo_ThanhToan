class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, id: false do |t|
      t.references :reviewer, index: true, foreign_key: { to_table: :customers }
      t.references :reviewed_customer, index: true, foreign_key: { to_table: :customers }
      t.references :receipt, foreign_key: true
      t.integer :review_type
      t.string :review

      t.timestamps
    end

    execute "ALTER TABLE reviews ADD PRIMARY KEY (reviewer_id, reviewed_customer_id, receipt_id);"
  end
end
