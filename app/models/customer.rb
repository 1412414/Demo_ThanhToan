class Customer < ApplicationRecord
	has_many :products
	has_many :complaints
	has_many :notifications
	has_many :reports
	has_many :reviews
end
