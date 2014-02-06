class SessionsController < ApplicationController

	def new
        redirect_to tickets_path if current_user
	end

	def create
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "You are singned in!!!"
            if user.codecery
                redirect_to code_index_path
            else
                redirect_to tickets_path
            end
        else
            flash[:danger] = "The email addresss or password you entered is not valid. Please try again."
            redirect_to "/sign_in"
        end
	end

	def destroy 
        session[:user_id] = nil
        flash[:danger] = "You are logged out!!!"
        redirect_to "/sign_in"
    end

end