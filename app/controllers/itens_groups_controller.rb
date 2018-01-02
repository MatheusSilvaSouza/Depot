class ItensGroupsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_itens_group, only: [:show, :edit, :update, :destroy]

  def index
    @itens_groups = ItensGroup.all
  end

  def show
  end

  def new
    @itens_group = ItensGroup.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @itens_group = @cart.add_product(product)

    respond_to do |format|
      if @itens_group.save
        format.html { redirect_to :root }
        format.js
        format.json { render :show, status: :created, location: @itens_group }
      else
        format.html { render :new }
        format.json { render json: @itens_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @itens_group.update(itens_group_params)
        format.html { redirect_to @itens_group, notice: 'Itens group was successfully updated.' }
        format.json { render :show, status: :ok, location: @itens_group }
      else
        format.html { render :edit }
        format.json { render json: @itens_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @itens_group.destroy
    respond_to do |format|
      format.html { redirect_to itens_groups_url, notice: 'Itens group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_itens_group
      @itens_group = ItensGroup.find(params[:id])
    end

    def itens_group_params
      params.require(:itens_group).permit(:product_id)
    end
end
