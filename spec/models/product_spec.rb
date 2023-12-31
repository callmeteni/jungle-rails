require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully when all fields are set' do
      category = Category.new(name: 'Product')
      product = Product.new(
        name: 'Product',
        price: 10.0,
        quantity: 5,
        category: category
      )
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      category = Category.new(name: 'Category')
      product = Product.new(
        price: 10.0,
        quantity: 5,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      category = Category.new(name: ' Category')
      product = Product.new(
        name: 'Product',
        quantity: 5,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      category = Category.new(name: 'Category')
      product = Product.new(
        name: 'Product',
        price: 10.0,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(
        name: 'Product',
        price: 10.0,
        quantity: 5
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
