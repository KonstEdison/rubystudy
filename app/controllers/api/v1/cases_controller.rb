module Api
  module V1
    class CasesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        @cases = Case.all
        render json: @cases
      end

      def show
        @case = Case.find(params[:id])
        render json: @case
      end

      def create
        @case = Case.new(case_params)
        if @case.save
          render json: @case, status: :created
        else
          render json: @case.errors, status: :unprocessable_entity
        end
      end

      def update
        @case = Case.find(params[:id])
        if @case.update(case_params)
          render json: @case, status: :ok
        else
          render json: @case.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @case = Case.find(params[:id])
        @case.destroy
        head :no_content
      end

      private

      def case_params
        params.require(:case).permit(:edison_case_code, :brand_name, :client_name, :law_firm, :internal_name)
      end
    end
  end
end
