class ItemsController < ApplicationController
  respond_to :json

  def index
    @category = Category.find(params[:category_id])
    @items = @category.items.where(wedding_id: params[:wedding_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      render json: @item, status: :created

    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    head :no_content
  end
end
