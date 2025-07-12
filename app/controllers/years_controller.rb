class YearsController < ApplicationController
  before_action :set_year, only: %i[show destroy]

  def index
    @years = Year.all
  end

  def new
    @year = Year.new
    @makes = Make.all
    @models = Model.all
  end

  def show
    # @year is already set by the before_action
  end

  def create
    @year = Year.new(year_params)
    if @year.save
      redirect_to new_year_path, notice: "Year was successfully created."
    else
      render :new
    end
  end

  def destroy
    @year.destroy
    redirect_to years_url, notice: "Year was successfully destroyed."
  end

  private

  def set_year
    @year = Year.find(params[:id])
  end

  def year_params
    params.require(:year).permit(:year, :make_id, :model_id)
  end
end
