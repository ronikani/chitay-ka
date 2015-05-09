class ImagehomesController < ApplicationController
  before_action :set_imagehome, only: [:show, :edit, :update, :destroy]

  # GET /imagehomes
  # GET /imagehomes.json
  def index
    @imagehomes = Imagehome.all
    @products = Product.all
  end

  # GET /imagehomes/1
  # GET /imagehomes/1.json
  def show
  end

  # GET /imagehomes/new
  def new
    @imagehome = Imagehome.new
  end

  # GET /imagehomes/1/edit
  def edit
  end

  # POST /imagehomes
  # POST /imagehomes.json
  def create
    @imagehome = Imagehome.new(imagehome_params)

    respond_to do |format|
      if @imagehome.save
        format.html { redirect_to @imagehome }
        format.json { render :show, status: :created, location: @imagehome }
      else
        format.html { render :new }
        format.json { render json: @imagehome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imagehomes/1
  # PATCH/PUT /imagehomes/1.json
  def update
    respond_to do |format|
      if @imagehome.update(imagehome_params)
        format.html { redirect_to @imagehome }
        format.json { render :show, status: :ok, location: @imagehome }
      else
        format.html { render :edit }
        format.json { render json: @imagehome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imagehomes/1
  # DELETE /imagehomes/1.json
  def destroy
    @imagehome.destroy
    respond_to do |format|
      format.html { redirect_to imagehomes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imagehome
      @imagehome = Imagehome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imagehome_params
      params.require(:imagehome).permit(:title,:slider)
    end
end
