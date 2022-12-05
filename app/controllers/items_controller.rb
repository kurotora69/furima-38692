class ItemsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    
  end 
  
  def create
    @user = User.new
    if @user.save
      redirect_to root_path
    else
      render :new
    end   
  end
  
  def destroy
    @user.destroy
    redirect_to root_path
  end


end

