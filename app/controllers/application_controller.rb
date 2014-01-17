class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  helper_method :comment_or_ticket

  def require_user 
  	redirect_to "/sign_in" unless current_user
  end

  def comment_or_ticket
    

    @ticket = Ticket.where(user: current_user).order("last_comment").last
      if @ticket.last_comment == nil 
        @ticket = Ticket.where(user: current_user).order(:updated_at).last
      else 
        @last_created = Ticket.where(user: current_user).order(:updated_at).last
        if @last_created.updated_at > @ticket.last_comment
          @ticket = @last_created
        end
      end
    @ticket

  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
