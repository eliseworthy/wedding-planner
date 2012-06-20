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

  it "is not valid without a category_id" do
    item.category_id = nil
    item.should_not be_valid
  end

  it "is not valid without a name" do
    item.name = nil
    item.should_not be_valid
  end

  it "is not valid witha name over 256 characters" do
    item.name = "x" * 257
    item.should_not be_valid
  end

  it "is not valid without a description" do
    item.description = nil
    item.should_not be_valid
  end

  it "is not valid with a description over 256 characters" do
    item.description = "x" * 257
    item.should_not be_valid
  end

  it "has an optional price field" do
    item.price = nil
    item.should be_valid
  end
end
