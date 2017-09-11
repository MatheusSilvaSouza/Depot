class StoreController < ApplicationController
  def index
    @all_products = Product.order(:title)
  end
end
