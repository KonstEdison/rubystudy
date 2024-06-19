class DefendantsController < ApplicationController
  before_action :set_case
  before_action :set_defendant, only: [:show, :edit, :update, :destroy]

  def index
    @defendants = @case.defendants
  end

  def show
  end

  def new
    @defendant = @case.defendants.build
  end

  def edit
  end

  def create
    @defendant = @case.defendants.build(defendant_params)
    if @defendant.save
      redirect_to case_defendants_path(@case), notice: 'Defendant was successfully created.'
    else
      render :new
    end
  end

  def update
    if @defendant.update(defendant_params)
      redirect_to case_defendants_path(@case), notice: 'Defendant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @defendant.destroy
    redirect_to case_defendants_path(@case), notice: 'Defendant was successfully destroyed.'
  end

  private
    def set_case
      @case = Case.find(params[:case_id])
    end

    def set_defendant
      @defendant = @case.defendants.find(params[:id])
    end

    def defendant_params
      params.require(:defendant).permit(:name, :marketplace_id, :location, :feedback, :notes)
    end
end
