class WeddingsController < ApplicationController
  respond_to :json

  def index
    @weddings = Wedding.all
  end

  def show
    @wedding = Wedding.find(params[:id])
  end

  def create
    @wedding = Wedding.new(params[:wedding])

    if @wedding.save
      render json: @wedding, status: :created, location: @wedding
    else
      render json: @wedding.errors, status: :unprocessable_entity
    end
  end

  def update
    @wedding = Wedding.find(params[:id])

    if @wedding.update_attributes(params[:wedding])
      head :no_content
    else
      render json: @wedding.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wedding = Wedding.find(params[:id])
    @wedding.destroy

    head :no_content
  end
end
