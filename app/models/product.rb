class Product < ActiveRecord::Base
  belongs_to :author
  belongs_to :category

 

  before_destroy :ensure_not_referenced_by_any_line_item
  
  has_many :line_items
  has_many :payments, class_name: :PaypalInstantPaymentNotification


  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
def paid?
  payments.find_by(status: 'Completed').present?
end

def self.search(search)
	if search
		Product.where(["title LIKE ?","%#{search}%"])
	else
		all
	end
end	


 private


 # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'существуют товарные позиции')
			return false
		end
	end
end

