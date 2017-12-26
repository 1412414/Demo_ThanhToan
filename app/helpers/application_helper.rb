module ApplicationHelper
	def categories_navbar
	 	categories = Category.select("category_name")
	 	select_input = ""

	 	categories.each do |category|
            select_input += "<option>#{category.category_name}</option>"
        end

        return select_input.html_safe
	end

	def sidebar
	 	product_types = ProductType.joins(:category).select("categories.id as cate_id, product_types.id as prod_id, categories.category_name, product_types.product_type_name").order("category_name DESC").distinct
	 	sidebar = ""
	 	category_name = product_types[0].category_name
	 	sidebar = "<li class=\"subMenu open\"><a> #{category_name}</a><ul style=\"display:none\">"

	 	product_types.each do |product_type|
	 		if product_type.category_name != category_name
	 			category_name = product_type.category_name
	 			sidebar += "</ul></li><li class=\"subMenu open\"><a> #{product_type.category_name}</a><ul style=\"display:none\">"
	 			sidebar += "<li><a href=\"" + category_product_type_path(product_type.cate_id, product_type.prod_id) + "\"><i class=\"fa fa-chevron-right\"></i> #{product_type.product_type_name}</a></li>"
	 		else
	 			sidebar += "<li><a href=\"" + category_product_type_path(product_type.cate_id, product_type.prod_id) + "\"><i class=\"fa fa-chevron-right\"></i> #{product_type.product_type_name}</a></li>"
	 		end     
        end

        sidebar += "</ul></li>"

        return sidebar.html_safe
	end

	def hot_auctions_sidebar
		auctions = Image.joins("INNER JOIN products ON products.id = images.product_id INNER JOIN auctions ON products.id = auctions.product_id")
		.where("images.id in (select id from images where product_id = products.id order by id DESC limit 1) and to_timestamp(ending_time,'yyyy-mm-dd HH24:MI:ss') > NOW()")
		.select("auctions.id as auction_id, auctions.current_price, products.description, products.product_name, auctions.created_at, images.*").limit(2)

		hot_auctions = ""

		auctions.each do |auction|
			hot_auctions += "<div class=\"thumbnail\"><img src=\"" + image_path(auction.image.url) +
			 "\" title=\"Bootshop New Kindel\" alt=\"Bootshop Kindel\"><div class=\"caption\">" + 
			 "<h5>#{auction.product_name}</h5><h4 style=\"text-align:center\"><a class=\"btn btn-success\">" + 
			 " #{auction.current_price} VNĐ </a> <a class=\"btn btn-default\" href=\"#\">Thêm vào <i class=\"fa fa-eye\"" + 
			 " aria-hidden=\"true\"></i></a> <a class=\"btn btn-primary\" href=\"" + auction_path(auction.auction_id) + "\"><i class=\"fa fa-gavel\" aria-hidden=\"true\"></i></a></h4></div></div><br/>"     
		end  
    
		return hot_auctions.html_safe
    end
end
