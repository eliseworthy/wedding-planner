require 'spec_helper'

describe ItemsController do
  render_views
  
  let!(:wedding) { FactoryGirl.create(:wedding) }
  let!(:item) { FactoryGirl.create(:item) }

  context 'index' do
    before(:each) do
      get :index, :format => :json, wedding_id: wedding.id
    end

    it 'renders an index' do
      response.should be_success
    end

    it 'returns an array of items' do
      body = JSON.parse(response.body)
      body["items"].should eq [{ 
        "id" => item.id,
        "name" => item.name,
        "description" => item.description,
        "wedding_id" => item.wedding_id,
        "created_at" => item.created_at.strftime('%FT%TZ')
      }]
    end
  end
  context 'show' do
    before(:each) do
      item
      get :show, format: :json, wedding_id: wedding.id, id: item.id
    end

    it 'renders the show' do
      response.should be_success
    end

    it 'returns a item hash' do
      body = JSON.parse(response.body)
      body.should == { 
        "id" => item.id,
        "name" => item.name,
        "description" => item.description,
        "wedding_id" => item.wedding_id,
        "created_at" => item.created_at.strftime('%FT%TZ')
      }
    end
  end

  context 'create' do
    it "should create a new item" do
      expect {
        post :create, wedding_id: wedding.id, :item => { name: 'Pretty item', description: 'Pretty!', wedding_id: 1}
      }.to change(Item, :count).by 1
    end
  end

  context 'update' do
    it "locates the item" do
      put :update, wedding_id: wedding.id, id: item, item: Factory.attributes_for(:item)
      assigns(:item).should eq(item) 
    end

    it "updates item's attributes" do
      put :update, wedding_id: wedding.id, id: item, item: Factory.attributes_for(:item, description: "Cool!")
      item.reload
      item.description.should eq("Cool!")
    end

    context "invalid attributes" do
      it "does not change the item's attributes" do
        put :update, wedding_id: wedding.id, id: item, item: Factory.attributes_for(:item, description: nil)
        item.reload
        item.description.should eq("The prettiest dress")
      end
    end
  end

  context 'destroy' do
    it "deletes the contact" do
      expect{
        delete :destroy, wedding_id: wedding.id, id: item       
      }.to change(Item, :count).by -1
    end
  end
end
