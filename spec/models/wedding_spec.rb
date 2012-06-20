require 'spec_helper'

describe Wedding do
  let!(:wedding) { FactoryGirl.create(:wedding) }

  it "is valid" do
    wedding.should be_valid
  end

  context "description" do
    it 'is not valid without a description' do
      wedding.description = nil
      wedding.should_not be_valid
    end

    it 'is not valid with a description over 256 characters' do
      wedding.description = "x" * 257
      wedding.should_not be_valid
    end

    it 'is not valid without a name' do
      wedding.name = nil
      wedding.should_not be_valid
    end

    it "is not valid without a user" do
      wedding.user_id = nil
      wedding.should_not be_valid
    end
  end
end