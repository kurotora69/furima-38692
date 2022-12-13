class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end 
  
  def create
    # binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end  
  end

  private
  def set_params
    params.require(:post_code, :prefecture_id, :city, :address, :building, :tel, :user_id, item_id ).merge(user_id: current_user.id, item_id: params[:item_id], users_item: params[:item_id])
  end
  # :user, :item,:users_itemはpermitに必要？permit


  def order_params
    params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :prefecture_id,
                                 :price, :explanation, :image).merge(user_id: current_user.id)
  end

end
