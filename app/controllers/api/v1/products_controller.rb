module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_defendant, only: [:index, :create, :show, :update, :destroy]
      before_action :set_product, only: [:show, :update, :destroy]

      def index
        if params[:defendant_id].present?
          @defendant = Defendant.find(params[:defendant_id])
          @products = @defendant.products
        else
          @products = Product.all
        end
        render json: @products
      end

      def show
        render json: @product
      end

      def create
        @defendant = Defendant.find(params[:defendant_id])  # Ensure this param is passed
        @product = @defendant.products.build(product_params)
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
          render json: @product, status: :ok
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        head :no_content
      end

      private

      def set_defendant
        @defendant = Defendant.find(params[:defendant_id]) if params[:defendant_id]
      end

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :price, :product_type, :marketplace_id, :items_sold, :notes, :tm_in_image, :tm_in_title, :tm_in_description, :design_patent, :utility_patent, :copyright_images, :copyright_texts, :fba, :trademark_used, :proof_of_sale, :should_sue, :copyright_usage_filenames, :tm_registration_number)
      end
    end
  end
end
