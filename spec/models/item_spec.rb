require 'spec_helper'

describe Item do
  let!(:item) { FactoryGirl.create(:item) }

  it "is valid" do
    item.should be_valid
  end

  it "is not valid without a wedding_id" do
    item.wedding_id = nil
    item.should_not be_valid
  end

  it "is not valid without a photo_url" do
    item.photo_url = nil
    item.should_not be_valid
  end

  it "is not valid without a description" do
    item.description = nil
    item.should_not be_valid
  end

  it "has an optional url field" do
    item.url = nil
    item.should be_valid
  end

  it "has an optional location field" do
    item.location = nil
    item.should be_valid
  end
end
