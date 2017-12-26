class Product < ApplicationRecord
  	belongs_to :product_type
 	belongs_to :customer
 	has_many :auctions
 	has_many :images
end
