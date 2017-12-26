# class CreateProductExaminations < ActiveRecord::Migration[5.1]
#   def change
#     create_table :product_examinations, id: false do |t|
#       t.string :examination_time
#       t.references :product, foreign_key: true
#       t.references :employee, foreign_key: true
#       t.string :reason
#       t.integer :status

#       t.timestamps
#     end

#     execute "ALTER TABLE product_examinations ADD PRIMARY KEY (created_at, product_id);"
#   end
# end

class CreateProductExaminations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_examinations do |t|
      t.string :examination_time
      t.references :product, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :reason
      t.integer :status

      t.timestamps
    end
  end
end
