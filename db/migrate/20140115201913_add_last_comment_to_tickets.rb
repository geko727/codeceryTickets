class AddLastCommentToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :last_comment, :datetime
  end
end
