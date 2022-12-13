class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end 
  
  def create
    @order = Order.new(set_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end  
  end

  private
  def set_params
    params.permit(:users_item, :delivery_charge_id, :price, :post_code, :prefecture_id, :city, :address, :building, :create_table).merge(user_id: current_user.id, item_id: params[:item_id], users_item_id:params[:item_id])
  end
  # :user, :itemはpermitに必要？


  def item_params
    params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :prefecture_id,
                                 :price, :explanation, :image).merge(user_id: current_user.id)
  end

end
