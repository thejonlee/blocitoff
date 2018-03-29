require 'pry'

class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @items = @user.items
    @item = current_user.items.build(item_params)
    @item.user = @user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item saved."
      redirect_to (current_user)
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  private
  def item_params
    # binding.pry
    # params[:item].permit(:name)
    params.require(:item).permit(:name)
  end

end
