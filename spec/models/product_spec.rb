require 'rails_helper'

describe Product do
  it "should be valid with name and price" do
    product = FactoryGirl.build(:product)
    expect(product).to be_valid
  end

  it "should be invalid withouth a name" do
    product = FactoryGirl.build(:product, name: nil)
    expect(product).to_not be_valid
  end

  it "should be invalid without a price" do
    product = FactoryGirl.build(:product, price: nil)
    expect(product).to_not be_valid
  end

  it "should be invalid with a duplicated name" do
    FactoryGirl.create(:product)
    product = FactoryGirl.build(:product)
    expect(product).to_not be_valid
    expect(product).to have(1).error_on(:name)
  end
end
