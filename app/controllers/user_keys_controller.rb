class UserKeysController < ApplicationController
respond_to :json

  def create
    @user_key = UserKey.new(api_key: params[:api_key])
    if @user_key.save
      render json: {notice: "API key accepted."}
    else
      render json: {error: "Unable to create new item"}, status: :unprocessable_entity
    end
  end
end
