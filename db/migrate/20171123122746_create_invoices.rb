class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :receipt, foreign_key: true
      t.integer :card_number
      t.integer :total_amount

      t.timestamps
    end
  end
end
