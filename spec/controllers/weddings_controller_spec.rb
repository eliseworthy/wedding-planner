require 'spec_helper'

describe WeddingsController do
  render_views

  def json_wedding(wedding)
    {
      "id" => wedding.id,
      "name" => wedding.name,
      "description" => wedding.description,
      "user_id" => wedding.user_id,
      "created_at" => wedding.created_at.strftime('%FT%TZ'),
      "photo_url" => wedding.photo_url
    }
  end

  let(:wedding)       { FactoryGirl.create(:wedding) }
  let(:birds_wedding) { FactoryGirl.create(:birds_wedding) }
  context 'index' do

  context "search using params" do
    before { wedding; birds_wedding }

    it "finds weddings from a user when given a user_id" do
      get :index, query: {user_id: 1}, :format => :json
      JSON.parse(response.body)["weddings"].should include json_wedding(wedding)
    end

    it "finds a wedding when given a name" do
      get :index, query: {name: birds_wedding.name}, :format => :json
      JSON.parse(response.body)["weddings"].should include json_wedding(birds_wedding)
    end

    it "doesn't find a wedding when given a different name" do
      get :index, query: {name: birds_wedding.name}, :format => :json
      JSON.parse(response.body)["weddings"].should_not include json_wedding(wedding)
    end

  end



    context 'search without user id' do
      context 'with at least 1 wedding' do
        before(:each) do
          wedding
          get :index, :format => :json
        end

        it 'renders an index' do
          response.should be_success
        end

        it 'returns an array of weddings' do
          body = JSON.parse(response.body)
          body["weddings"].should eq [json_wedding(wedding)]
        end
      end
    end

    context 'with no weddings' do
      before(:each) do
        get :index, :format => :json
      end

      it 'has a 200 error code' do
        response.status.should == 200
      end

      it 'returns an empty array' do
        body = JSON.parse(response.body)
        body.should == {"weddings" => []}
      end
    end
  end

  context 'show' do
    context 'correct parameters' do
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
          "created_at" => wedding.created_at.strftime('%FT%TZ'),
          "photo_url" => wedding.photo_url
        }
      end
    end

    context 'incorrect parameters' do
      before(:each) do
        get :show, format: :json, id: 1
      end

      it 'return an error code' do
        response.status.should == 404
      end

      it 'returns an error message' do
        body = JSON.parse(response.body)
        body["error"].should ==  "Wedding not found"
      end
    end
  end

  context 'create' do
    context "correct parameters" do
      it "should create a new wedding" do
        expect {
          post :create, :wedding => { name: 'Pretty wedding', description: 'Pretty!', user_id: 1}
        }.to change(Wedding, :count).by 1
      end

      it "should set a photo url" do
        post :create, :wedding => { name: 'Pretty wedding', description: 'Pretty!', user_id: 1}
        Wedding.last.photo_url.should_not be_nil
      end
    end

    context "incorrect parameters" do
      before(:each) do
        post :create, :wedding => { name: nil, description: 'Pretty!', user_id: 1}
      end

      it "returns an error code" do
        response.status.should == 422
      end

      it 'returns an error message' do
        body = JSON.parse(response.body)
        body["error"].should ==  "Cannot create wedding"
      end
    end
  end

  context 'update' do
    context 'correct attributes' do
      it "locates the wedding" do
        put :update, id: wedding, wedding: FactoryGirl.attributes_for(:wedding)
        assigns(:wedding).should eq(wedding)
      end

      it "updates wedding's attributes" do
        put :update, id: wedding, wedding: FactoryGirl.attributes_for(:wedding, description: "Cool!")
        wedding.reload
        wedding.description.should eq("Cool!")
      end

      it "updates wedding's photo_url" do
        put :update, id: wedding, wedding: FactoryGirl.attributes_for(:wedding, photo_url: "http://sample.com")
        wedding.reload
        wedding.photo_url.should eq("http://sample.com")
      end
    end

    context "invalid attributes" do
      before(:each) do
        put :update, id: wedding, wedding: FactoryGirl.attributes_for(:wedding, description: nil)
      end

      it "does not change the wedding's attributes" do
        wedding.reload
        wedding.description.should eq("A great zombie")
      end

      it 'returns an error code' do
        response.status.should == 422
      end

      it 'returns an error message' do
        body = JSON.parse(response.body)
        body['error'].should == "Cannot update wedding"
      end
    end
  end

  context 'destroy' do
    context 'correct parameters' do
      it "deletes the contact" do
        wedding
        expect{
          delete :destroy, id: wedding
        }.to change(Wedding, :count).by -1
      end
    end

    context 'invalid parameters' do
      before(:each) do
        wedding
        delete :destroy, id: wedding.id + 1
      end

      it 'returns an error code' do
        response.status.should == 422
      end

      it 'returns an error message' do
        body = JSON.parse(response.body)
        body["error"].should == "Cannot find wedding, unable to delete"
      end
    end
  end
end

