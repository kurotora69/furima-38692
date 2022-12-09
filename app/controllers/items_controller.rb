class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ]

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    # @items = @user.items.include(:user)
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :prefecture_id, :price, :explanation, :image, ).merge(user_id: current_user.id)
  end

end

   