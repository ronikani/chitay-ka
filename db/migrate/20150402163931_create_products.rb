class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.references :author, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.integer :isbn
      t.integer :year
      t.text :description
      t.string :filming
      t.integer :quantity
      t.float :price
      t.boolean :sale

      t.timestamps null: false
    end
  end
end
