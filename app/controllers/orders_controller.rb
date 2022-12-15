class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index,  only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end 
  
  def create
    @order = UsersItem.create(order_params)
    UsersAddress.create(address_params)
    if @order.valid?
        @order.save
        return redirect_to root_path
      else
        render 'index'
      end 
  end


  private

  def order_params
    params.permit(:user_item).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building, :tel).merge(users_item_id: @order.id)
  end

  def item_params
    params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :prefecture_id,
                                 :price, :explanation, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end

# if @order.valid?
#   @order.save
#   return redirect_to root_path
# else
#   render 'index'
# end  
