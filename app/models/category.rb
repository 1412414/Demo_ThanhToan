class Category < ApplicationRecord
	has_many :product_types, :foreign_key => 'category_id'
end
