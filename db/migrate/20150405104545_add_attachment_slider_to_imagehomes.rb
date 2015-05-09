class AddAttachmentSliderToImagehomes < ActiveRecord::Migration
  def self.up
    change_table :imagehomes do |t|
      t.attachment :slider
    end
  end

  def self.down
    remove_attachment :imagehomes, :slider
  end
end
