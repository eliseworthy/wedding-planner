class WeddingsController < ApplicationController
  # GET /weddings
  # GET /weddings.json
  respond_to :json

  def index
    @weddings = Wedding.all
  end

  # GET /weddings/1
  # GET /weddings/1.json
  def show
    @wedding = Wedding.find(params[:id])
  end

  # GET /weddings/new
  # GET /weddings/new.json
  def new
    @wedding = Wedding.new

    render json: @wedding
  end

  # POST /weddings
  # POST /weddings.json
  def create
    @wedding = Wedding.new(params[:wedding])

    if @wedding.save
      render json: @wedding, status: :created, location: @wedding
    else
      render json: @wedding.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
    @wedding = Wedding.find(params[:id])

    if @wedding.update_attributes(params[:wedding])
      head :no_content
    else
      render json: @wedding.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    @wedding = Wedding.find(params[:id])
    @wedding.destroy

    head :no_content
  end
end
