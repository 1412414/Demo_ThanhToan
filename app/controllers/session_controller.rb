class SessionController < ApplicationController
	def new
		
	end

	def create
		if params[:session].present?
			customer = Customer.find_by(session_email_params)
		
			if customer.nil?
				flash[:login_error] = "Wrong email!!!"

				render :new
			else 
				if customer.authenticate(session_pass_params)	
				    session[:customer_name_current_customer] = customer["customer_name"];
					session[:id_current_customer] = customer["id"];

					redirect_to auction_index_path
				else
					flash[:login_error] = "Wrong password!!!"

					render :new
				end
			end		
		end
	end

	def destroy
		session.delete(:customer_name_current_customer)
		session.delete(:id_current_customer)

		redirect_to auction_index_path
	end

	private
	def session_email_params
		params.require(:session).permit(:username)
	end

	private
	def session_pass_params
		params.require(:session).permit(:password)
	end

	def authenticate
    if session[:id_current_customer]
      redirect_to auction_index_path
    end
  end
end
