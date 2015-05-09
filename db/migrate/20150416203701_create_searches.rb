class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :category_id
      t.integer :author_id
      t.float :min_price
      t.float :max_price
      t.string :isbn

      t.timestamps null: false
    end
  end
end
