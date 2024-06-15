class ProductsController < ApplicationController
  before_action :set_defendant, only: [:index, :new, :create, :destroy, :update]

  def index
    if @defendant
      @products = @defendant.products
    else
      @products = Product.all
    end
  end

  def new
    @product = @defendant.products.build
  end

  def create
    @product = @defendant.products.build(product_params)
    if @product.save
      redirect_to defendant_products_path(@defendant), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @defendant = Defendant.find(params[:defendant_id])
    @product = @defendant.products.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Product or Defendant not found.'
  end

  def update
    @product = @defendant.products.find(params[:id])
    if @product.update(product_params)
      redirect_to defendant_products_path(@defendant), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = @defendant.products.find(params[:id])
    @product.destroy
    redirect_to defendant_products_path(@defendant), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :type, :marketplace_id, :items_sold, :notes, :tm_in_image, :tm_in_title, :tm_in_description, :design_patent, :utility_patent, :copyright_images, :copyright_texts, :fba, :trademark_used, :proof_of_sale, :should_sue, :copyright_usage_filenames, :tm_registration_number)
  end

  def set_defendant
    @defendant = Defendant.find(params[:defendant_id])
  end
end
