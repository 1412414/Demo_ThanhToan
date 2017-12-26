Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	get '/', to: 'auction#index'

 	# Tạo ra categories và category/:id/product_type
 	resources :category do
 		collection do
 			post 'get_product_type'
 		end

 		resources :product_type
 	end

 	# Tạo ra /customer và /customer/:id/product và /customer/:id/auction, ....
 	resources :customer do
 		resources :product
 		resources :auction
 		resources :favorite_list
 		resources :receipt do
 			get 'pay'	
 			post 'hook'
 		end

 		resources :invoice
 		resources :report
 		resources :review
 		resources :complaint
 		resources :notification
 	end

 	# Tạo ra /employee/:id/complaint
 	resources :employee do
 		resources :complaint
 	end

 	# Tạo ra /auction
 	resources :auction do
 		collection do
 			post 'bid'
 		end

 		post 'buy_it_now'

 		resources :auction_detail
 	end
  
 	resources :product_examination
end
