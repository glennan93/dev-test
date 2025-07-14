# frozen_string_literal: true

# Controller for managing Car records.
# Handles listing, showing, creating, editing, updating, and deleting cars in the inventory system.
# Also provides methods to fetch cars for a specific year, make, model, and dealership.
class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path, notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to cars_url, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:year_id, :make_id, :model_id, :trim, :count, :dealership_id)
  end
end
