# frozen_string_literal: true

# Controller for managing Year records.
# Handles listing, showing, creating, editing, updating, and deleting years in the inventory system.
# Also provides a method to fetch years for a specific model and make.
class YearsController < ApplicationController
  before_action :set_year, only: %i[show edit update destroy]

  def index
    @years = Year.all
  end

  def new
    @year = Year.new
    @makes = Make.all
    @models = Model.all
  end

  def show; end

  def edit; end

  def create
    @year = Year.new(year_params)
    if @year.save
      redirect_to new_year_path, notice: 'Year was successfully created.'
    else
      render :new
    end
  end

  def update
    if @year.update(year_params)
      redirect_to years_url, notice: 'Year was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @year.destroy
    redirect_to years_url, notice: 'Year was successfully destroyed.'
  end

  def for_model
    @years = Year.where(model_id: params[:model_id], make_id: params[:make_id])
    render json: @years
  end

  private

  def set_year
    @year = Year.find(params[:id])
  end

  def year_params
    params.require(:year).permit(:year, :make_id, :model_id)
  end
end
