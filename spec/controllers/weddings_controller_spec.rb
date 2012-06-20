require 'spec_helper'

describe WeddingsController do
  let(:wedding) { FactoryGirl.create(:wedding) }

  context 'index' do
    before(:each) do
      wedding
      get :index
    end
    it 'renders an index' do
      response.should be_successful
    end

    it 'shows all wedding name, description, and user_id' do
      response.body.should eq [{ 
        "id" => wedding.id,
        "name" => wedding.name,
        "description" => wedding.description
      }]
    end
  end
end