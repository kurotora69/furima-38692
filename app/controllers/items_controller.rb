class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :price, :explanation, :user, :image).merge(user_id: current_user.id)
  end
end
