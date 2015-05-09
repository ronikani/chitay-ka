class OrdersController < ApplicationController
    include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  #before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    
    @line_items = LineItem.all
    @products = Product.all.paginate(:page => params[:page], :per_page => 8)
    @orders = Order.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to product_url, notice: "Ваша корзина пуста"
    return
  end

    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
     @order =  Order.new(order_params)
     @order.add_line_items_from_cart(@cart)
     @order.user_email    = current_user.email
     @order.status    = "Заказ обрабатывается"
    respond_to do |format|
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
    format.html { redirect_to products_path, notice:'Благодарим за ваш заказ.' }
    format.json { render action: 'show', status: :created,location: @order }
    else
      @cart = current_cart
    format.html { render action: 'new' }
    format.json { render json: @order.errors,status: :unprocessable_entity }
    end
  end
    # @order = current_cart.build_order(order_params)
     
    # @order.cart_id       = current_cart.id
    # @current_cart        = Cart.new(cart_params)
    #  if @order.save
    #   # if @order.purchase
    #      render :action => "success"
    #    
    #  else
    #    render :action => 'new'
    #  end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  #def download_pdf
  #output = ReportPdf.new.to_pdf
#  send_data output, :type => 'application/pdf', :filename => "orders.pdf"
#end

  def edit_multiple
      @orders = Order.find(params[:order_ids]) 
  end
    
  def update_multiple
     if params[:commit] == 'Сохранить'
      @orders = Order.find(params[:order_ids]) 
      @orders.each do |order|
      order.update(order_params)
   end
      flash[:notice] = "Статус заказов обновлен!"
      redirect_to orders_path
     elsif params[:commit] == 'Удалить'
       @orders = Order.find(params[:order_ids]) 
        @orders.each do |order|
          order.destroy
        end
        flash[:notice] = "Заказы удалены!"
        redirect_to orders_path
      end    
  end

  def destroy_multiple
    @orders = Order.find(params[:order_ids]) 
      @orders.each do |order|
        order.destroy
      end
      flash[:notice] = "Заказы удалены!"
      redirect_to orders_path     
  end  


  def vozvrat
    @orders = Order.where(:status => 'Возврат').order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def nedost
    @orders = Order.where(:status => 'Недоставлен').order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:first_name, :last_name, :country, :city, :adress, :phone, :status)
    end

    def cart_params
      params[:cart]
    end
end
