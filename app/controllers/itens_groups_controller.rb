class ItensGroupsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_itens_group, only: [:show, :edit, :update, :destroy]

  # GET /itens_groups
  # GET /itens_groups.json
  def index
    @itens_groups = ItensGroup.all
  end

  # GET /itens_groups/1
  # GET /itens_groups/1.json
  def show
  end

  # GET /itens_groups/new
  def new
    @itens_group = ItensGroup.new
  end

  # GET /itens_groups/1/edit
  def edit
  end

  # POST /itens_groups
  # POST /itens_groups.json
  def create
    product = Product.find(params[:product_id])
    @itens_group = @cart.itens_group.build(product: product)
    # @itens_group = ItensGroup.new(itens_group_params)

    respond_to do |format|
      if @itens_group.save
        format.html { redirect_to @itens_group.cart, notice: 'Itens group was successfully created.' }
        # format.html { redirect_to @itens_group, notice: 'Itens group was successfully created.' }
        format.json { render :show, status: :created, location: @itens_group }
      else
        format.html { render :new }
        format.json { render json: @itens_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itens_groups/1
  # PATCH/PUT /itens_groups/1.json
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

  # DELETE /itens_groups/1
  # DELETE /itens_groups/1.json
  def destroy
    @itens_group.destroy
    respond_to do |format|
      format.html { redirect_to itens_groups_url, notice: 'Itens group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itens_group
      @itens_group = ItensGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itens_group_params
      params.require(:itens_group).permit(:product_id, :cart_id)
    end
end
