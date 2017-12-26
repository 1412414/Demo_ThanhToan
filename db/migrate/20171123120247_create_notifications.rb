class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :content
      t.string :sending_time
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
