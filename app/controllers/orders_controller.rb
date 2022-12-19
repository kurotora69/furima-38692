class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create ]
  before_action :set_order, only: [:index, :create ]
  before_action :move_to_index,  only: [:create, :index]


  def index
    @order = Order.new
    if @item.users_item.present?
      redirect_to root_path
    else
      render :index
    end  
  end

  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end 
  end


  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building, :tel, :users_item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end 

  def set_order
    @item = Item.find(params[:item_id])
  end  
 
  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end  

end

