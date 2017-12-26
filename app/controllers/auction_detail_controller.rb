class AuctionDetailController < ApplicationController
	def index
		@auction_details = AuctionDetail.select("auction_details.*, customers_of_auctions.*").joins(:customers_of_auction).where("auction_id = " + params["auction_id"])

		render layout: "without_carousel"
	end
end
