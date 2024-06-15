class DefendantsController < ApplicationController
  before_action :set_defendant, only: [:show, :edit, :update, :destroy]

  def index
    @defendants = Defendant.all
  end

  def show
  end

  def new
    @defendant = Defendant.new
  end

  def edit
  end

  def create
    @defendant = Defendant.new(defendant_params)
    if @defendant.save
      redirect_to @defendant, notice: 'Defendant was successfully created.'
    else
      render :new
    end
  end

  def update
    if @defendant.update(defendant_params)
      redirect_to @defendant, notice: 'Defendant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @defendant.destroy
    redirect_to defendants_url, notice: 'Defendant was successfully destroyed.'
  end

  private
    def set_defendant
      @defendant = Defendant.find(params[:id])
    end

    def defendant_params
      params.require(:defendant).permit(:name, :marketplace_id, :location, :feedback, :notes)
    end
end
