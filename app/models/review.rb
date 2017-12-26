class Review < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :receipt
end
