require 'spec_helper'

describe Category do
  subject { FactoryGirl.create(:category) }
  its(:valid?) {should be_true}

  it "validates name" do
    subject.name = nil
    subject.should_not be_valid
  end
end
