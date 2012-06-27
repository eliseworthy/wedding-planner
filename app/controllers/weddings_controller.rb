class WeddingsController < ApplicationController
  respond_to :json

  def index
    @weddings = Wedding.where(params[:query]).to_a
  end

  def show
    if @wedding = Wedding.find_by_id(params[:id])
    else render json: {error: "Wedding not found"}, status: :not_found
    end
  end

  def create
    @wedding = Wedding.new(params[:wedding])

    if @wedding.save
      render json: @wedding, status: :created
    else
      render json: {error: "Cannot create wedding"}, status: :unprocessable_entity
    end
  end

  def update
    if @wedding = Wedding.find_by_id(params[:id])
      if @wedding.update_attributes(params[:wedding])
        render json: @wedding
      else
        render json: {error: "Cannot update wedding"}, status: :unprocessable_entity
      end
    else render json: {error: "Cannot find wedding, unable to update"}, status: :unprocessable_entity
    end
  end

  def destroy
    if @wedding = Wedding.find_by_id(params[:id])
      @wedding.destroy
      head :no_content
    else render json: {error: "Cannot find wedding, unable to delete"}, status: :unprocessable_entity
    end
  end
end
