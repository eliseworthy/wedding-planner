require 'spec_helper'

describe WeddingsController do
  it "renders an index" do
    get :index 
    response.should be_successful
  end
end