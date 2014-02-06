class AddCodeceyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :codecery, :boolean, :default => false
  end
end
