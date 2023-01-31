require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category= Category.new 
      @product = Product.new ( {price_cents: 199,
      image: "url.com/image.jpg",
      name: "Plant name",
      price: 1.99,
      quantity: 9,
      category: @category })
    end
    # validation tests/examples here
    it "should save successfully" do
      if @product.save 
        bool= true
      end
      expect(bool).to be(true)
    end

    it "should throw error because name doesn't exist" do
      @product = Product.new({price_cents: 199,
      image: "url.com/image.jpg",
      
      price: 1.99,
      quantity: 9,
      category: @category})
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should throw error because price doesn't exist" do
      @product = Product.new({
      image: "url.com/image.jpg",
      name: "Plant name",
      
      quantity: 9,
      category: @category})
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should throw error because quantity doesn't exist" do
      @product = Product.new({price_cents: 199,
      image: "url.com/image.jpg",
      name: "Plant name",
      price: 1.99,
      
      category: @category})
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should throw error because category doesn't exist" do
      @product = Product.new({price_cents: 199,
      image: "url.com/image.jpg",
      name: "Plant name",
      price: 1.99,
      quantity: 9
      })
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
