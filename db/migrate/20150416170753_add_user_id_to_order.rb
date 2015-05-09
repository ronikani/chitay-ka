class AddUserIdToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :user_email, :string
  end
end
