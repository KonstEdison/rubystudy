module Api
  module V1
    class DefendantsController < ApplicationController
      # Ensure that the controller responds with JSON
      protect_from_forgery with: :null_session

      def index
        if params[:case_id].present?
          @case = Case.find(params[:case_id])
          @defendants = @case.defendants
        else
          @defendants = Defendant.all
        end
        render json: @defendants
      end

      def show
        @defendant = Defendant.find(params[:id])
        render json: @defendant
      end

      def create
        @defendant = Defendant.new(defendant_params)
        if @defendant.save
          render json: { id: @defendant.id, message: "Defendant created successfully." }, status: :created
        else
          render json: @defendant.errors, status: :unprocessable_entity
        end
      end

      def update
        @defendant = Defendant.find(params[:id])
        if @defendant.update(defendant_params)
          render json: @defendant, status: :ok
        else
          render json: @defendant.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @defendant = Defendant.find(params[:id])
        @defendant.destroy
        head :no_content
      end

      private

      def defendant_params
        params.require(:defendant).permit(:name, :marketplace_id, :location, :feedback, :notes)
      end
    end
  end
end
