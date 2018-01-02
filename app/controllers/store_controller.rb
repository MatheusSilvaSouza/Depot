class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :layout_params

  def layout_params
    @page_title = 'Catalog'
  end

  def index
    @all_products = Product.order(:title)
  end
end
