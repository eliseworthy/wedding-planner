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

  context 'create' do
    it "should create a new wedding" do
      expect {
        post :create, :wedding => { name: 'Pretty wedding', description: 'Pretty!', user_id: 1}
      }.to change(Wedding, :count).by 1
    end
  end

  context 'update' do
    it "locates the wedding" do
      put :update, id: wedding, wedding: Factory.attributes_for(:wedding)
      assigns(:wedding).should eq(wedding) 
    end

    it "updates wedding's attributes" do
      put :update, id: wedding, wedding: Factory.attributes_for(:wedding, description: "Cool!")
      wedding.reload
      wedding.description.should eq("Cool!")
    end

    context "invalid attributes" do
      it "does not change the wedding's attributes" do
        put :update, id: wedding, wedding: Factory.attributes_for(:wedding, description: nil)
        wedding.reload
        wedding.description.should eq("A great zombie")
      end
    end
  end

  context 'destroy' do
    it "deletes the contact" do
      expect{
        delete :destroy, id: wedding       
      }.to change(Wedding, :count).by -1
    end
  end
end

