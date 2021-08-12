class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item_id
  before_action :root

  def index
      @order = OrderAddress.new
  end
  
  def create
    @order = OrderAddress.new(order_address_params)
        if  @order.valid?
            @order.save
            
          redirect_to root_path
        else
          render :index
        end
  end

  def order_address_params
    params.require(:order_address).permit(:post, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
 
  private
   def find_item_id
    @item = Item.find(params[:item_id])
   end

   def root
    if @item.order.present?  ||  @item.user_id == current_user.id
      redirect_to root_path
    end
   end

end

