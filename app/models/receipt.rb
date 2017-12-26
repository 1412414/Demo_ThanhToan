class Receipt < ApplicationRecord
  belongs_to :auction
  belongs_to :customer
  has_many :reports

  def paypal_url(return_path, notify_url)
  	p "Notify_url: #{Rails.application.secrets.app_host}#{notify_url}"
  	values = {
			business: "thienphuvuong-facilitator@gmail.com",
			cmd: "_xclick",
			upload: 1,
			return: "#{Rails.application.secrets.app_host}#{return_path}",
	        invoice: id,
	        amount: total_amount,
	        item_name: Product.joins(:auctions).select("product_name").where("auctions.id = " + auction_id.to_s)[0].product_name,
	        item_number: auction_id,
	        quantity: '1',
	        notify_url: "#{Rails.application.secrets.app_host}#{notify_url}"
		}

	"#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
