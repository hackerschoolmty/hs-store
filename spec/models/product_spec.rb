require 'rails_helper'

describe Product do
  it "should be valid with name and price" do
    product = Product.new(name: "cats", price: 100.0)
    expect(product).to be_valid
  end

  it "should be invalid withouth a name" do
    product = Product.new(name: nil, price: 100)
    expect(product).to_not be_valid
  end

  it "should be invalid without a price" do
    product = Product.new(name: "cats", price: nil)
    expect(product).to_not be_valid
  end

  it "should be invalid with a duplicated name" do
    Product.create(name: "cats", price: 100)
    product = Product.new(name: "cats", price: 100)
    expect(product).to_not be_valid
    expect(product).to have(1).error_on(:name)
  end
end
