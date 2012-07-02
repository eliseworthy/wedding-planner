class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies

  before_filter :validate_key!, :except => [:index, :show]

  def validate_key!
    user_key = UserKey.find_by_api_key(params[:api_key])
    error(:forbidden) unless user_key
  end
end
