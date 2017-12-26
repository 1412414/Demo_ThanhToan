class ProductController < ApplicationController
	def new
		@danhmuc = Category.all;
		
		render layout: "without_sidebar_carousel"
	end

	def edit
		render layout: "without_sidebar_carousel"
	end

	def create
		p params
		productId = Product.maximum("id") + 1	
		Product.create!(id: productId, product_name: params["TenSanPham"], 
			description: params["MoTa"], product_type_id: params["LoaiSanPham"], customer_id: 1)
		p "Thêm xong sản phẩm"

		productExaminationId = ProductExamination.maximum("id") + 1
		ProductExamination.create!(id: productExaminationId, examination_time: nil, product_id: productId, employee_id: nil, reason: "", status: 0)	

		imageId = Image.maximum("id") + 1
		images = params["HinhAnh"]

		p images

		images.each do |i|
			Image.create!(id: imageId, image: i, product_id: productId)

			imageId += 1
		end

		p "Thêm xong hình ảnh"

		auctionId = Auction.maximum("id") + 1

		auctions = params["Phien"]

		auctions.each do |a|
			p a

			Auction.create!(id: auctionId, ending_time: a["ThoiGianKetThuc"].gsub!('T',' '), 
				starting_time: a["ThoiGianBatDau"].gsub!('T',' '),
				starting_price: a["GiaKhoiDiem"], current_price: a["GiaKhoiDiem"], max_price: a["GiaTran"], buy_it_now_price: params["GiaMuaNgay"], 
				bid_increment: a["BuocGia"], status: 0, product_id: productId)

			p "Thoi gian ket thuc chuyen qua to_time: "
			p a["ThoiGianKetThuc"].to_time

			Auction.delay(run_at: a["ThoiGianKetThuc"].to_datetime).KetThucPhien(auctionId)

			auctionId += 1
		end

		redirect_to action: "new"
	end
end
