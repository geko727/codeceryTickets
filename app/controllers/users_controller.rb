class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)
			if @user.save
               flash[:notice] = "You have registered, now log in."
               redirect_to "/sign_in"
           	else 
               render :new
            end        
        end

        private

        def users_params
                params.require(:user).permit(:name, :last_name, :email, :company, :password)
        end
end