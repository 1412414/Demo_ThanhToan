class ProductExaminationController < ApplicationController
	def index
		# @productexaminations = ProductExamination.where(status: 0)

		@mas = Image.joins("INNER JOIN products ON products.id = images.product_id INNER JOIN product_examinations ON products.id = product_examinations.product_id and status = 0")
		.where("images.id in (select id from images where product_id = products.id order by id DESC limit 1)")
		.select("product_examinations.*, products.description, products.product_name, images.*, product_examinations.id as foo")

		render layout: "without_sidebar_carousel"
	end

	def show
		
	end

	def edit
		@productexamination = ProductExamination.find(params[:id])

		@mas = Image.joins("INNER JOIN products ON products.id = images.product_id INNER JOIN product_examinations ON products.id = product_examinations.product_id and product_examinations.id = "+params[:id])
		.where("images.id in (select id from images where product_id = products.id order by id DESC)")
		.select("product_examinations.*, products.description, products.product_name, images.*, product_examinations.id as foo")

		render layout: "without_sidebar_carousel"
	end

	def update
		@productexamination = ProductExamination.find(params[:id])
		
		# @productexamination.employee = NHANVIENXETDUYET !!!!!!!!!!!!!!!!!!!!! #######################################
		# @productexamination.update(params.require(:productexamination).permit(:employee, :reason, :status))
		
		@productexamination.update(params.require(:product_examination).permit(:reason, :status))
		@productexamination.update_attribute(:examination_time, DateTime.now)			

		# GUIMAILCHOKHACHHANG !!!!!!!!!!!!!!!!!!!!!!
		# 
		# 
		# 
		# 
		# 
		
		# GUITHONGBAOCHOKHACHHANG !!!!!!!!!!!!!!!!!
		noti = @productexamination.product.customer.notifications.new
		noti.id = Notification.maximum("id") + 1
		noti.content = "Lý do: " + @productexamination.reason
		noti.sending_time = DateTime.now
		if (@productexamination.status == 1)
			noti.title = "Sản phẩm " + @productexamination.product.product_name + "của bạn không được duyệt"
		end

		if (@productexamination.status == 2)
			noti.title = "Sản phẩm " + @productexamination.product.product_name + "của bạn đã được duyệt"
		end

		noti.save
		
		redirect_to product_examination_index_path
	end
end
