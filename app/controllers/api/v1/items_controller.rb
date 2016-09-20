class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, :status => 201
    else
      render "Item could not be created"
    end
  end

  def destroy
    if Item.destroy(params[:id])
      render :nothing => true, :status => 204
    else
      render "The item you are trying to delete does not exist"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
