require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  

  def new_product(title="title", description="description", image_url="", price=1)
    return Product.new(title:title, description: description,
                       image_url: image_url, price:price)
  end

  test 'default product' do
    product = new_product
    assert product.valid?,  product.to_json + ' should be valid'
  end


  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].blank?
  end

  test "product price must be positive" do
    product = new_product

    product.price = -1
    assert product.invalid?, product.to_json + ' should be invalid'
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?, product.to_json + ' should be invalid'
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0.001
    assert product.invalid?, product.to_json + ' should be invalid'
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?, product.to_json + ' should be valid'
  end

  test 'product uniqueness of title' do
    product = new_product(title=products(:one).title)

    assert product.invalid?, products(:one).to_json + product.to_json
    assert_equal ["has already been taken"], product.errors[:title]
  end

end
