class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]
  before_action :move_to_index,  only: [ :new, :create, :index]
  # except: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if @item.users_item.present?
      redirect_to root_path
    else
      render :index
    end  
  end

  def new
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
  end 
  
  def create
    # binding.pry
    @item = Item.find(params[:item_id])
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
 

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end  

end

