class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports, id: false do |t|
      t.references :receipt, foreign_key: true
      t.references :reporter, index: true, foreign_key: { to_table: :customers }
      t.references :reported_customer, index: true, foreign_key: { to_table: :customers }
      t.string :reason
      t.references :employee, foreign_key: true

      t.timestamps
    end

    execute "ALTER TABLE reports ADD PRIMARY KEY (receipt_id, reporter_id, reported_customer_id);"
  end
end
