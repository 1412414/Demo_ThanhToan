class FavoriteList < ApplicationRecord
  self.primary_keys = :customer_id, :auction_id
  belongs_to :customer
  belongs_to :auction
end
