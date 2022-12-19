class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,  only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])
    # if @item.users_item.present?
    #   redirect_to root_path
    # else
    #   render :show
    # end    
    
  end

  def edit
    if @item.users_item.present?
      redirect_to root_path
    else
      render :edit
    end  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :detail_id, :delivery_charge_id, :number_day_id, :prefecture_id,
                                 :price, :explanation, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
