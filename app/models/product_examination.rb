class ProductExamination < ApplicationRecord
  belongs_to :product
  belongs_to :employee, optional: true
end
