class Imagehome < ActiveRecord::Base
	has_attached_file :slider
    validates_attachment_content_type :slider, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
