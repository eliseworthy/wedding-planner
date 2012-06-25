require 'spec_helper'

describe ItemsController do
  render_views
  
  let!(:item) { FactoryGirl.create(:item) }
  let!(:wedding) { item.wedding }
  let!(:category) { item.category }

  # context 'index' do
  #   context 'correct parameters' do
  #     before(:each) do
  #       get :index, :format => :json, wedding_id: wedding.id, category_id: category.id
  #     end

  #     it 'renders an index' do
  #       response.should be_success
  #     end

  #     it 'returns an array of items' do
  #       body = JSON.parse(response.body)
  #       body.should == { "items" => [{ 
  #         "id" => item.id,
  #         "name" => item.name,
  #         "description" => item.description,
  #         "wedding_id" => item.wedding_id,
  #         "created_at" => item.created_at.strftime('%FT%TZ')
  #         }],
  #         "category" => {
  #           "id" => item.category.id,
  #           "name" => item.category.name          
  #         }}
  #     end
  #   end

  #   context 'incorrect parameters' do
  #     before(:each) do
  #       get :index, :format => :json, wedding_id: wedding.id
  #     end

  #     it 'should throw a 404' do
  #       response.status.should == 404 
  #     end

  #     it 'has an error message' do
  #       body = JSON.parse(response.body)
  #       body["error"].should == "Category not found"
  #     end
  #   end
  # end

  context 'index' do
    context 'correct parameters' do
      before(:each) do
        get :index, :format => :json, wedding_id: wedding.id
      end

      it 'renders an index' do
        response.should be_success
      end

      it 'returns an array of items' do
        body = JSON.parse(response.body)
        body.should == { "items" => [{ 
          "id" => item.id,
          "name" => item.name,
          "description" => item.description,
          "wedding_id" => item.wedding_id,
          "created_at" => item.created_at.strftime('%FT%TZ')
          }],
          "category" => {
            "id" => item.category.id,
            "name" => item.category.name          
          }}
      end
    end

    context 'incorrect parameters' do
      before(:each) do
        get :index, :format => :json, wedding_id: wedding.id
      end

      it 'should throw a 404' do
        response.status.should == 404 
      end

      it 'has an error message' do
        body = JSON.parse(response.body)
        body["error"].should == "Category not found"
      end
    end
  end

  context 'show' do
    context 'correct parameters' do 
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
          "created_at" => item.created_at.strftime('%FT%TZ'),
          "category" => {
            "id" => item.category.id,
            "name" => item.category.name,          
          }
        }
      end
    end

    context 'incorrect parameters' do
      before(:each) do
        item
        get :show, format: :json, id: item.id + 1
      end

      it 'has a 404 error' do
        response.status.should == 404
      end

      it 'has an error message' do
        body = JSON.parse(response.body)
        body["error"].should == "Item not found"
      end
    end
  end

  context 'create' do
    context 'correct parameters' do 
      it "should create a new item" do
        expect {
          post :create, wedding_id: wedding.id, :item => { name: 'Pretty item', description: 'Pretty!', wedding_id: FactoryGirl.create(:wedding).id , category_id: FactoryGirl.create(:category).id }
        }.to change(Item, :count).by 1
      end
    end

    context 'incorrect parameters' do
      before(:each) do
        post :create, wedding_id: wedding.id, :item => { name: 'Pretty item', description: nil, wedding_id: FactoryGirl.create(:wedding).id , category_id: FactoryGirl.create(:category).id }
      end 

      it 'has a 422 status' do
        response.status.should == 422
      end

      it 'has an error message' do
        body = JSON.parse(response.body)
        body["error"].should == "Unable to create new item"
      end
    end
  end

  context 'update' do

    context 'correct attributes' do 
      before(:each) do
        put :update, wedding_id: wedding.id, id: item, item: Factory.attributes_for(:item, description: "Cool!")
      end
      it "locates the item" do
        assigns(:item).should eq(item) 
      end

      it "updates item's attributes" do
        item.reload
        item.description.should eq("Cool!")
      end
    end

    context "invalid attributes" do
      before(:each) do
        put :update, wedding_id: wedding.id, id: item, item: Factory.attributes_for(:item, description: nil)
      end
      
      it "does not change the item's attributes" do
        item.reload
        item.description.should eq("The prettiest dress")
      end

      it "has a 422 status" do
        response.status.should == 422
      end

      it "returns an error message" do
        body = JSON.parse(response.body)
        body["error"].should == "Unable to update item"
      end
    end
  end

  context 'destroy' do
    context 'correct attribute' do 
      it "deletes the contact" do
        expect{
          delete :destroy, wedding_id: wedding.id, id: item       
        }.to change(Item, :count).by -1
      end
    end

    context 'incorrect attributes' do
      before(:each) do
        delete :destroy, wedding_id: wedding.id, id: item.id + 1       
      end

      it "has a 422 status" do
        response.status.should == 422
      end

      it "returns an error message" do
        body = JSON.parse(response.body)
        body["error"].should == "Unable to find this item; cannot delete it"
      end
    end
  end
end
