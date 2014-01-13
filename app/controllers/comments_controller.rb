class CommentsController < ApplicationController
	def create
		@ticket = Ticket.find(params[:ticket_id])
		@comment = Comment.new(comment_params)
		@comment.ticket = @ticket
		respond_to do |format|
		      if @comment.save
		        format.html { redirect_to @ticket, notice: 'Comment was successfully created.' }
		        format.json { render action: 'show', status: :created, location: @ticket }
		      else
		        format.html { render action: 'new' }
		        format.json { render json: @ticket.errors, status: :unprocessable_entity }
		      end
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end