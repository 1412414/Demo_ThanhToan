# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Notification.delete_all
Report.delete_all
Complaint.delete_all
Review.delete_all
Invoice.delete_all
Receipt.delete_all
AuctionDetail.delete_all
CustomersOfAuction.delete_all
FavoriteList.delete_all
Auction.delete_all
ProductExamination.delete_all
Image.delete_all
Product.delete_all
Customer.delete_all
Employee.delete_all
ProductType.delete_all
Category.delete_all

# Thêm danh mục sản phẩm
Category.create!(id: 1, category_name: "Quần áo")
Category.create!(id: 2, category_name: "Xe")
Category.create!(id: 3, category_name: "Trang sức")
Category.create!(id: 4, category_name: "Gia dụng")
Category.create!(id: 5, category_name: "Điện tử")

# Thêm loại sản phẩm
ProductType.create!(id: 1, product_type_name: "Áo nam", category_id: 1)
ProductType.create!(id: 2, product_type_name: "Áo nữ", category_id: 1)
ProductType.create!(id: 3, product_type_name: "Xe đạp", category_id: 2)
ProductType.create!(id: 4, product_type_name: "Xe tay ga", category_id: 2)
ProductType.create!(id: 5, product_type_name: "Đồng hồ", category_id: 3)
ProductType.create!(id: 6, product_type_name: "Dây chuyền", category_id: 3)
ProductType.create!(id: 7, product_type_name: "Bàn", category_id: 4)
ProductType.create!(id: 8, product_type_name: "Ghế", category_id: 4)
ProductType.create!(id: 9, product_type_name: "Tivi", category_id: 5)
ProductType.create!(id: 10, product_type_name: "Điện thoại", category_id: 5)

# Thêm nhân viên
Employee.create!(id: 1, employee_name: "Nguyễn Thị Hoàng Anh", username: "hoanganh@gmail.com", password_digest: "")
Employee.create!(id: 2, employee_name: "Trần Minh Phúc", username: "minhphuc@gmail.com", password_digest: "")
Employee.create!(id: 3, employee_name: "Lê Kim Hoàng", username: "kimhoang@gmail.com", password_digest: "")
Employee.create!(id: 4, employee_name: "Lý Hoàng Minh", username: "hoangminh@gmail.com", password_digest: "")

# Thêm khách hàng
Customer.create!(id: 1, customer_name: "Lê Mỹ Anh", username: "myanh@gmail.com", email: "lemyanh@gmail.com", password_digest: "", customer_type: "vip", address: "122 Nguyễn Trãi TPHCM", shipping_address: "122 Nguyễn Trãi TPHCM", negative_points: 14, positive_points: 50, total_transactions: 100, blocker_id: nil, blocking_time: "", number_of_created_products_in_a_month: 14, paypal: "")
Customer.create!(id: 2, customer_name: "Nguyễn Huyền Quý Châu", username: "quychau@gmail.com", email: "quychau@gmail.com", password_digest: "", customer_type: "thường", address: "10 Hông Bàn TPHCM", shipping_address: "10 Hông Bàn TPHCM", negative_points: 4, positive_points: 60, total_transactions: 78, blocker_id: nil, blocking_time: "", number_of_created_products_in_a_month: 2, paypal: "")
Customer.create!(id: 3, customer_name: "Lê Tiến Thịnh", username: "tienthinh@gmail.com", email: "tienthinh@gmail.com", password_digest: "", customer_type: "vip", address: "1 Nguyễn Tri Phương TPHCM", shipping_address: "1 Nguyễn Tri Phương TPHCM", negative_points: 55, positive_points: 60, total_transactions: 155, blocker_id: "", blocking_time: "", number_of_created_products_in_a_month: 20, paypal: "")
Customer.create!(id: 4, customer_name: "Nguyễn Phước Tiến", username: "phuoctien@gmail.com", email: "phuoctien@gmail.com", password_digest: "", customer_type: "thường", address: "34 Nguyễn văn Cừ TPHCM", shipping_address: "34 Nguyễn văn Cừ TPHCM", negative_points: 5, positive_points: 87, total_transactions: 100, blocker_id: nil, blocking_time: "", number_of_created_products_in_a_month: 5, paypal: "")
Customer.create!(id: 5, customer_name: "Phan Khánh Lâm", username: "khanhlam@gmail.com", email: "khanhlam@gmail.com", password_digest: "", customer_type: "thường", address: "12 Lê Hồng Phong TPHCM", shipping_address: "12 Lê Hồng Phong TPHCM", negative_points: 15, positive_points: 67, total_transactions: 89, blocker_id: nil, blocking_time: "", number_of_created_products_in_a_month: 1, paypal: "")
Customer.create!(id: 6, customer_name: "Vương Thiên Phú", username: "thienphu@gmail.com", email: "thienphu@gmail.com", password_digest: "", customer_type: "thường", address: "1525 3 Tháng 2 TPHCM", shipping_address: "1525 3 Tháng 2 TPHCM", negative_points: 75, positive_points: 22, total_transactions: 100, blocker_id: 4, blocking_time: "2017-11-15", number_of_created_products_in_a_month: 5, paypal: "")
Customer.create!(id: 7, customer_name: "Lương Vỹ Minh", username: "vyminh@gmail.com", email: "vyminh@gmail.com", password_digest: "", customer_type: "thường", address: "45 Nguyễn Văn Cừ TPHCM", shipping_address: "45 Nguyễn Văn Cừ TPHCM", negative_points: 100, positive_points: 18, total_transactions: 156, blocker_id: 4, blocking_time: "2017-11-15", number_of_created_products_in_a_month: 5, paypal: "")

# Thêm sản phẩm
Product.create!(id: 1, product_name: "Áo nữ mùa đông", description: Faker::Lorem.paragraph, product_type_id: 1, customer_id: 1)
Product.create!(id: 2, product_name: "Áo nữ mùa hè", description: Faker::Lorem.paragraph, product_type_id: 1, customer_id: 1)
Product.create!(id: 3, product_name: "Áo nữ mùa xuân", description: Faker::Lorem.paragraph, product_type_id: 1, customer_id: 1)
Product.create!(id: 4, product_name: "Áo nam mùa hè", description: Faker::Lorem.paragraph, product_type_id: 2, customer_id: 2)
Product.create!(id: 5, product_name: "Áo nam mùa đông", description: Faker::Lorem.paragraph, product_type_id: 2, customer_id: 2)
Product.create!(id: 6, product_name: "Áo nam mùa thu", description: Faker::Lorem.paragraph, product_type_id: 2, customer_id: 2)
Product.create!(id: 7, product_name: "Xe đạp XYZ", description: Faker::Lorem.paragraph, product_type_id: 3, customer_id: 3)
Product.create!(id: 8, product_name: "Xe đạp ABC", description: Faker::Lorem.paragraph, product_type_id: 3, customer_id: 3)
Product.create!(id: 9, product_name: "Xe đạp HYZ", description: Faker::Lorem.paragraph, product_type_id: 3, customer_id: 3)
Product.create!(id: 10, product_name: "Xe tay ga ABC", description: Faker::Lorem.paragraph, product_type_id: 4, customer_id: 4)
Product.create!(id: 11, product_name: "Xe tay ga DYZ", description: Faker::Lorem.paragraph, product_type_id: 4, customer_id: 4)
Product.create!(id: 12, product_name: "Xe tay ga OOO", description: Faker::Lorem.paragraph, product_type_id: 4, customer_id: 4)
Product.create!(id: 13, product_name: "Đồng hồ Thụy Sĩ", description: Faker::Lorem.paragraph, product_type_id: 5, customer_id: 5)
Product.create!(id: 14, product_name: "Đồng hồ Pháp", description: Faker::Lorem.paragraph, product_type_id: 5, customer_id: 5)
Product.create!(id: 15, product_name: "Đồng hồ Đức", description: Faker::Lorem.paragraph, product_type_id: 5, customer_id: 5)
Product.create!(id: 16, product_name: "Dây chuyền ngọc trai", description: Faker::Lorem.paragraph, product_type_id: 6, customer_id: 6)
Product.create!(id: 17, product_name: "Dây chuyền đá huyền ảo", description: Faker::Lorem.paragraph, product_type_id: 6, customer_id: 6)
Product.create!(id: 18, product_name: "Dây chuyền Elizabeth", description: Faker::Lorem.paragraph, product_type_id: 6, customer_id: 6)
Product.create!(id: 19, product_name: "Bàn gỗ hiện đại", description: Faker::Lorem.paragraph, product_type_id: 7, customer_id: 3)
Product.create!(id: 20, product_name: "Bàn gỗ truyền thống XYZ", description: Faker::Lorem.paragraph, product_type_id: 7, customer_id: 3)
Product.create!(id: 21, product_name: "Bàn học sinh Happy", description: Faker::Lorem.paragraph, product_type_id: 7, customer_id: 3)
Product.create!(id: 22, product_name: "Ghế happy", description: Faker::Lorem.paragraph, product_type_id: 8, customer_id: 4)
Product.create!(id: 23, product_name: "Ghế ghỗ XYZ", description: Faker::Lorem.paragraph, product_type_id: 8, customer_id: 4)
Product.create!(id: 24, product_name: "Ghế cao HHH", description: Faker::Lorem.paragraph, product_type_id: 8, customer_id: 4)
Product.create!(id: 25, product_name: "Tivi Panasonic", description: Faker::Lorem.paragraph, product_type_id: 9, customer_id: 5)
Product.create!(id: 26, product_name: "Tivi màn hình phẳng J689", description: Faker::Lorem.paragraph, product_type_id: 9, customer_id: 5)
Product.create!(id: 27, product_name: "Tivi Samsung XYZ", description: Faker::Lorem.paragraph, product_type_id: 9, customer_id: 5)
Product.create!(id: 28, product_name: "Samsung Galaxy J7", description: Faker::Lorem.paragraph, product_type_id: 10, customer_id: 6)
Product.create!(id: 29, product_name: "Iphone X", description: Faker::Lorem.paragraph, product_type_id: 10, customer_id: 6)
Product.create!(id: 30, product_name: "BPhone", description: Faker::Lorem.paragraph, product_type_id: 10, customer_id: 6)
Product.create!(id: 31, product_name: "Samsung Galaxy J7", description: Faker::Lorem.paragraph, product_type_id: 10, customer_id: 6)
Product.create!(id: 32, product_name: "Dây chuyền Elizabeth", description: Faker::Lorem.paragraph, product_type_id: 6, customer_id: 6)
Product.create!(id: 33, product_name: "Đồng hồ Thụy Sĩ", description: Faker::Lorem.paragraph, product_type_id: 5, customer_id: 5)
Product.create!(id: 34, product_name: "Đồng hồ Thụy Sĩ", description: Faker::Lorem.paragraph, product_type_id: 5, customer_id: 5)
Product.create!(id: 35, product_name: "Bàn học sinh Happy", description: Faker::Lorem.paragraph, product_type_id: 7, customer_id: 3)
Product.create!(id: 36, product_name: "Iphone X", description: Faker::Lorem.paragraph, product_type_id: 10, customer_id: 6)


# Thêm duyệt sản phẩm chấp nhận
(1..30).each do |i|
	ProductExamination.create!(examination_time: DateTime.current, product_id: i, employee_id: 2, reason: "OK", status: 2)
end

# Thêm duyệt sản phẩm không cho đăng
(31..33).each do |i|
	ProductExamination.create!(examination_time: DateTime.current, product_id: i, employee_id: 2, reason: "Không phù hợp", status: 1)
end

# Chưa duyệt sản phẩm
(34..36).each do |i|
	ProductExamination.create!(examination_time: nil, product_id: i, employee_id: nil, reason: nil, status: 0)
end

# Thêm ảnh cho sản phẩm
t = 1
images = ["aonumuadong.jpg", "aonumuahe.jpg", "aonumuaxuan.jpg", "aonammuahe.jpg", "aonammuadong.jpg", "aonammuathu.jpg", "xedapxyz.jpg", "xedapabc.jpg", "xedaphyz.jpg", "xetaygaabc.png", "xetaygadyz.png", "xetaygaooo.jpg", "donghothuysi.jpg", "donghophap.jpg", "donghoduc.jpg", "daychuyenngoctrai.jpg", "daychuyenhuyenao.jpg", "daychuyenelizabeth.jpg", "bangohiendai.png", "bangotruyenthong.jpg", "banhocsinh.jpg", "ghehappy.jpg", "ghegoxyz.jpg", "ghecaohhh.jpg", "tivipanasonic.jpg", "tivimanhinhphang.jpg", "tivisamsung.jpg", "samsungj7.jpg", "iphonex.jpg", "bphone.jpg", "samsungj7.jpg", "daychuyenelizabeth.jpg", "donghothuysi.jpg", "donghothuysi.jpg", "banhocsinh.jpg", "iphonex.jpg"]
(1..36).each do |j|
	(1..5).each do |i|
		Image.create!(id: t, image: File.new("#{Rails.root}/app/assets/images/" + images[j - 1]), product_id: j)
		t += 1
	end
end

# Tạo phiên đấu giá, chi tiết đấu giá, tạo hóa đơn người mua (Receipt), người bán (Invoice) và thông báo cho khách hàng khi đấu giá kết thúc
customers = [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6]
t = 1
j = 1
k = 1
(1..30).each do |i|
	# Đã kết thúc đấu giá
		Auction.create!(id: t, ending_time: "2017-10-20 12:45:50", starting_time: "2017-10-17 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: i)
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 2, max_bid_amount: 15000)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 12:55:50", bid_amount: 10000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 3, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 14:45:50", bid_amount: 20000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 5, max_bid_amount: 40000)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-19 12:45:50", bid_amount: 30000, status: 0)
		k += 1

		#Thông báo sau khi kết thúc đấu giá
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 2)
		j += 1
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 3)
		j += 1
		Notification.create!(id: j, title: "Kết quả đấu giá " + t.to_s, content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 5)
		j += 1
		# Tạo hóa đơn cho người mua
		Receipt.create!(id: t, auction_id: t, customer_id: 5, card_number: "34xxxxxx21", product_received: 1, status: 1, total_amount: 30000)
		# Tạo hóa đơn cho người bán sau khi người mua đã nhận hàng
		Invoice.create!(id: t, receipt_id: t, card_number: "24xxxxxx39", total_amount: 2000)
		# Người mua gửi đánh giá cho người bán
		Review.create!(reviewer_id: 5, reviewed_customer_id: customers[i - 1], receipt_id: t, review_type: 1, review: "Hàng đúng với chất lượng")
	# Đã kết thúc đấu giá và chưa thanh toán
		t += 1
		Auction.create!(id: t, ending_time: "2017-10-20 12:45:50", starting_time: "2017-10-17 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: i)
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 2, max_bid_amount: 15000)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 12:55:50", bid_amount: 10000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 3, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 14:45:50", bid_amount: 20000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 5, max_bid_amount: 40000)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-19 12:45:50", bid_amount: 30000, status: 0)
		k += 1

		#Thông báo sau khi kết thúc đấu giá
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 2)
		j += 1
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 3)
		j += 1
		Notification.create!(id: j, title: "Kết quả đấu giá " + t.to_s, content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 5)
		j += 1
		# Tạo hóa đơn cho người mua
		Receipt.create!(id: t, auction_id: t, customer_id: 5, card_number: nil, product_received: 0, status: 0, total_amount: 30000)
		# Tạo hóa đơn cho người bán sau khi người mua đã nhận hàng
		Invoice.create!(id: t, receipt_id: t, card_number: "24xxxxxx39", total_amount: 2000)
		# Chưa kết thúc đấu giá
		t += 1
		Auction.create!(id: t, ending_time: "2017-12-26 12:45:50", starting_time: "2017-12-05 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: i)
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 2, max_bid_amount: 15000)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-12-23 12:55:50", bid_amount: 10000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 3, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-12-24 12:45:50", bid_amount: 20000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 5, max_bid_amount: 40000)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-12-24 15:45:50", bid_amount: 30000, status: 0)
		k += 1
	# Vẫn chưa bắt đầu đấu giá
		t += 1
		Auction.create!(id: t, ending_time: "2017-12-30 12:45:50", starting_time: "2017-12-26 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: i)
		t += 1
		Auction.create!(id: t, ending_time: "2017-12-30 12:45:50", starting_time: "2017-12-25 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: i)
		t += 1
		p "Dang tao auction"
end

# Tạo receipt vi phạm
	# Đã được nhân viên duyệt
		Auction.create!(id: t, ending_time: "2017-10-20 12:45:50", starting_time: "2017-10-17 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: 30)
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 2, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 12:55:50", bid_amount: 150000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 3, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 14:45:50", bid_amount: 20000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 5, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-19 12:45:50", bid_amount: 30000, status: 0)
		k += 1
		#Thông báo sau khi kết thúc đấu giá
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 2)
		j += 1
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 3)
		j += 1
		Notification.create!(id: j, title: "Kết quả đấu giá " + t.to_s, content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 5)
		j += 1
		Receipt.create!(id: t, auction_id: t, customer_id: 5, card_number: "34xxxxxx21", product_received: 0, status: 1, total_amount: 30000)
		Review.create!(reviewer_id: 5, reviewed_customer_id: customers[29], receipt_id: t, review_type: 0, review: "Không chịu giao hàng")
		# Báo cáo vi phậm
		Report.create!(receipt_id: t, reporter_id: 5, reported_customer_id: customers[29], reason: "Không chịu giao hàng", employee_id: 1)
		t += 1
	# Chưa được nhân viên duyệt
		Auction.create!(id: t, ending_time: "2017-10-20 12:45:50", starting_time: "2017-10-17 12:45:50", current_price: 30000, max_price: 170000, buy_it_now_price: 150000, bid_increment:5000, status: 0, product_id: 30)
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 2, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 12:55:50", bid_amount: 150000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 3, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-17 14:45:50", bid_amount: 20000, status: 0)
		k += 1
		CustomersOfAuction.create!(id: k, auction_id: t, customer_id: 5, max_bid_amount: 0)
		AuctionDetail.create!(id: k, customers_of_auction_id: k, bid_time: "2017-10-19 12:45:50", bid_amount: 30000, status: 0)
		k += 1
		#Thông báo sau khi kết thúc đấu giá
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 2)
		j += 1
		Notification.create!(id: j, title: "Đấu giá " + t.to_s + " bị outpid", content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 3)
		j += 1
		Notification.create!(id: j, title: "Kết quả đấu giá " + t.to_s, content: "Bạn đã bị outpid", sending_time: "2017-10-20 12:45:50", customer_id: 5)
		j += 1
		Receipt.create!(id: t, auction_id: t, customer_id: 5, card_number: "34xxxxxx21", product_received: 0, status: 1, total_amount: 30000)
		Review.create!(reviewer_id: 5, reviewed_customer_id: customers[29], receipt_id: t, review_type: 0, review: "Không chịu giao hàng")
		# Báo cáo vi phậm
		Report.create!(receipt_id: t, reporter_id: 5, reported_customer_id: customers[29], reason: "Không chịu giao hàng", employee_id: nil)
		t += 1

# Thêm danh sách yêu thích cho người dùng
FavoriteList.create!(customer_id: 1, auction_id: 2)
FavoriteList.create!(customer_id: 1, auction_id: 3)
FavoriteList.create!(customer_id: 2, auction_id: 3)
FavoriteList.create!(customer_id: 2, auction_id: 6)
FavoriteList.create!(customer_id: 2, auction_id: 7)
FavoriteList.create!(customer_id: 2, auction_id: 11)
FavoriteList.create!(customer_id: 3, auction_id: 34)
FavoriteList.create!(customer_id: 3, auction_id: 35)
FavoriteList.create!(customer_id: 3, auction_id: 38)
FavoriteList.create!(customer_id: 3, auction_id: 46)
FavoriteList.create!(customer_id: 3, auction_id: 47)
FavoriteList.create!(customer_id: 4, auction_id: 118)
FavoriteList.create!(customer_id: 4, auction_id: 119)
FavoriteList.create!(customer_id: 4, auction_id: 102)
FavoriteList.create!(customer_id: 5, auction_id: 14)
FavoriteList.create!(customer_id: 5, auction_id: 15)
FavoriteList.create!(customer_id: 5, auction_id: 103)
FavoriteList.create!(customer_id: 6, auction_id: 78)
FavoriteList.create!(customer_id: 6, auction_id: 79)
FavoriteList.create!(customer_id: 6, auction_id: 63)
FavoriteList.create!(customer_id: 6, auction_id: 62)

# Thêm khiếu nại nhân viên
Complaint.create!(id: 1, customer_id: 6, employee_id: 4, complaint_day: "2017-11-18", handled: 1, reason: "Tại sao lại block tôi?")
Complaint.create!(id: 2, customer_id: 7, employee_id: 4, complaint_day: "2017-11-18", handled: 0, reason: "Tại sao lại block tôi?")

