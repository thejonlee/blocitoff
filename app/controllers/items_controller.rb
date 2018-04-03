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
      # redirect_to (current_user)
    else
      flash[:error] = "Error saving item. Please try again."
      # render :new
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item completed!"
    else
      flash[:alert] = "Item couldn't be deleted. Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def item_params
    # binding.pry
    # params[:item].permit(:name)
    params.require(:item).permit(:name)
  end

end
