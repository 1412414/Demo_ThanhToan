class CategoryController < ApplicationController
	def get_product_type
		@SanPham = ProductType.where(["category_id = ?", params["category_id"]])

		render json: @SanPham
	end
end
