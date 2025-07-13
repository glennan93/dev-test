# frozen_string_literal: true

class MakesController < ApplicationController
  before_action :set_make, only: %i[show edit update destroy]

  def index
    @makes = Make.all
  end

  def new
    @make = Make.new
  end

  def show; end

  def edit; end

  def create
    @make = Make.new(make_params)
    if @make.save
      redirect_to new_make_path, notice: 'Make was successfully created.'
    else
      render :new
    end
  end

  def update
    if @make.update(make_params)
      redirect_to makes_url, notice: 'Make was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @make.destroy
    redirect_to makes_url, notice: 'Make was successfully destroyed.'
  end

  private

  def set_make
    @make = Make.find(params[:id])
  end

  def make_params
    params.require(:make).permit(:name)
  end
end
