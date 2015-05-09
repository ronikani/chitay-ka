class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def sale
  	@products = Product.all
  end

  def newbook
  	@products = Product.all
  end

  def static_order
    @products = Product.all.paginate(:page => params[:page], :per_page => 8)
  end
end
