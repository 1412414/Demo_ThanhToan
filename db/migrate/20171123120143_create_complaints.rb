class CreateComplaints < ActiveRecord::Migration[5.1]
  def change
    create_table :complaints do |t|
      t.references :customer, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :complaint_day
      t.integer :handled
      t.string :reason

      t.timestamps
    end
  end
end
