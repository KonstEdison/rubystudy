class CasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find(params[:id])
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      redirect_to cases_path, notice: 'Case was successfully created.'
    else
      render :new
    end
  end

  def edit
    @case = Case.find(params[:id])
  end

  def update
    @case = Case.find(params[:id])
    if @case.update(case_params)
      redirect_to cases_path, notice: 'Case was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @case = Case.find(params[:id])
    @case.destroy
    redirect_to cases_url, notice: 'Case was successfully destroyed.'
  end

  private

  def case_params
    params.require(:case).permit(:edison_case_code, :brand_name, :client_name, :law_firm, :internal_name)
  end
end
