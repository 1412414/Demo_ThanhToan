class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
