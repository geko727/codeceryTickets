class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.string :status

      t.timestamps
    end
  end
end
