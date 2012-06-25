class ItemsController < ApplicationController
  respond_to :json

  # def index
  #   if @category = Category.find_by_id(params[:category_id])
  #      if @items = @category.items.where(wedding_id: params[:wedding_id])
  #     else render json: {error: "No items found"}, status: :not_found
  #     end
  #   else render json: {error: "Category not found"}, status: :not_found
  #   end
  # end

  def index
    @items = Item.where(wedding_id: params[:wedding_id])  
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
