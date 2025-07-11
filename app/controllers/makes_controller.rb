class MakesController < ApplicationController
  before_action :set_make, only: %i[show]

  def index
    @makes = Make.all
  end

  def new
    @make = Make.new
  end

  def show
    # @make is already set by the before_action
  end

  def create
    @make = Make.new(make_params)
    if @make.save
      redirect_to new_make_path, notice: "Make was successfully created."
    else
      render :new
    end
  end

  private

  def set_make
    @make = Make.find(params[:id])
  end

  def make_params
    params.require(:make).permit(:name)
  end
end
