# class ExhibitsController < ApplicationController
#   before_action :authenticate_user!, except: [:index ]

#   def new
#     @item = Item.new
#   end

#   def create
#     @item = Item.new(item_params)
#     if @prototype.save
#       redirect_to root_path
#     else
#       render :new
#     end 
#   end

#   private

#   def item_params
#     params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :prefecture_id, :price, :explanation, :user, :image).merge(user_id: current_user.id)
#   end

# end