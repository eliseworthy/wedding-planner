class ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.where(wedding_id: params[:wedding_id])
    render json: {error: "Items not found for this wedding"}, status: :not_found if @items.empty?
  end

  def show
    if @item = Item.find_by_id(params[:id])
    else render json: {error: "Item not found"}, status: :not_found
    end
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      render json: @item, status: :created
    else
      render json: {error: "Unable to create new item"}, status: :unprocessable_entity
    end
  end

  def update
    if @item = Item.find_by_id(params[:id])
      if @item.update_attributes(params[:item])
        head :no_content
      else render json: {error: "Unable to update item"}, status: :unprocessable_entity
      end
    else
      render json: {error: "Item not found"}, status: :unprocessable_entity
    end
  end

  def destroy
    if @item = Item.find_by_id(params[:id])
      @item.destroy
      head :no_content
    else
      render json: {error: "Unable to find this item; cannot delete it"}, status: :unprocessable_entity
    end
  end
end
