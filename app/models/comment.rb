class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user

  after_save :update_last_comment

  private

  def update_last_comment
  	self.ticket.touch(:last_comment) if self.ticket
  end
end
