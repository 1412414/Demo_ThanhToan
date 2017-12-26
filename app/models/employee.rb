class Employee < ApplicationRecord
	has_many :complaints
	has_many :reports
end
