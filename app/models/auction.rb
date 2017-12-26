class Auction < ApplicationRecord
  	belongs_to :product

  	class << self
	  	def KetThucPhien(auction_id)
	  		p "Ket thuc phien"

			current_price = Auction.select("current_price")
				.where("auction_id = " + auction_id)[0].current_price

			winner = CustomersOfAuction.joins(:auction_details).select("customer_id")
				.where("auction_details.bid_amount = " + current_price + 
				" and auction_id = " + auction_id)[0].customer_id

			Notification.create!(id: Notification.maximum("id") + 1, title: "Chiến thắng đấu giá " + auction_id,
			 content: "Thắng đấu giá", sending_time: Time.now, customer_id: winner)

			Receipt.create!(id: Receipt.maximum("id") + 1, auction_id: auction_id, customer_id: winner,
			 card_number: nil, product_received: 0, status: 0, total_amount: current_price)

			Invoice.create!(id: Invoice.maximum("id") + 1, receipt_id: Receipt.maximum("id"), 
				card_number: nil, total_amount: current_price * 5 / 100)
		end
	end
end
