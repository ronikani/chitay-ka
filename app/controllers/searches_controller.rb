class SearchesController < ApplicationController

	def new
		@authors 	 = Author.all
	    @categories = Category.all
  		@search = Search.new
	end

	def create
	  @search = Search.create(search_params)
	  redirect_to @search
	end

	def show
	 @search 	 = Search.find(params[:id])
	 @authors 	 = Author.all
	 @categories = Category.all 
	end

 
	private	

	def search_params
		params.require(:search).permit(:keywords, :category_id, :author_id, :min_price, :max_price, :isbn)
	end
end
