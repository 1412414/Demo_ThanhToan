class Report < ApplicationRecord
  belongs_to :receipt
  belongs_to :customer, optional: true
  belongs_to :employee, optional: true
end
