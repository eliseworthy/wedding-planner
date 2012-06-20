require 'spec_helper'

describe WeddingsController do
  render_views

  let!(:wedding) { FactoryGirl.create(:wedding) }

  context 'index' do
    before(:each) do
      get :index, :format => :json
    end

    it 'renders an index' do
      response.should be_success
    end

    it 'returns an array of weddings' do
      body = JSON.parse(response.body)
      body["weddings"].should eq [{ 
        "id" => wedding.id,
        "name" => wedding.name,
        "description" => wedding.description,
        "user_id" => wedding.user_id,
        "created_at" => wedding.created_at.strftime('%FT%TZ')
      }]
    end
  end
  context 'show' do
    before(:each) do
      wedding
      get :show, format: :json, id: wedding.id
    end

    it 'renders the show' do
      response.should be_success
    end

    it 'returns a wedding hash' do
      body = JSON.parse(response.body)
      body.should == { 
        "id" => wedding.id,
        "name" => wedding.name,
        "description" => wedding.description,
        "user_id" => wedding.user_id,
        "created_at" => wedding.created_at.strftime('%FT%TZ')
      }
    end
  end
end

