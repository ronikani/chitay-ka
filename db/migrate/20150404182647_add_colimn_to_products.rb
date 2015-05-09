class AddColimnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :publishing, :string
    add_column :products, :cover, :string
    add_column :products, :new, :boolean
    add_column :products, :old_price, :float
  end
end
