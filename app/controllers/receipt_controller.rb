class ReceiptController < ApplicationController
	def index
		@receipts = Auction.joins("INNER JOIN products ON products.id = auctions.product_id INNER JOIN receipts ON receipts.auction_id = auctions.id")
			.select("receipts.*, products.product_name")
			.where("receipts.customer_id = " + params["customer_id"] + " and receipts.status <> 1")

		render layout: "without_carousel"
	end

	def pay
		@receipt = Receipt.find_by_id(params[:receipt_id])

		redirect_to @receipt.paypal_url(customer_receipt_index_path(params[:customer_id]),
			customer_receipt_hook_path({ :customer_id => params[:customer_id], :receipt_id => params[:receipt_id] }))
	end

	protect_from_forgery except: [:hook]
	def hook
		p "Trong hook"
		
		params.permit! # Permit all Paypal input params	
	    status = params[:payment_status]

	    p status

	    if status == "Completed"
	      @receipt = Receipt.find params["receipt_id"]
	      @receipt.update_attributes status: 1
	    end

	    head :ok
	end
end
