class CreateImagehomes < ActiveRecord::Migration
  def change
    create_table :imagehomes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
