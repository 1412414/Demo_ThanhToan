class CustomersOfAuction < ApplicationRecord
	belongs_to :customer
	belongs_to :auction
end
