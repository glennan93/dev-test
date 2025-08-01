# frozen_string_literal: true

# Controller for managing Model records.
# Handles listing, showing, creating, editing, updating, and deleting models in the inventory system.
# Also provides a method to fetch models for a specific make.
class ModelsController < ApplicationController
  before_action :set_model, only: %i[show edit update destroy]

  def index
    @models = Model.all
  end

  def show; end

  def new
    @model = Model.new
  end

  def edit; end

  def create
    @model = Model.new(model_params)
    if @model.save
      redirect_to new_model_path, notice: 'Model was successfully created.'
    else
      render :new
    end
  end

  def update
    if @model.update(model_params)
      redirect_to models_url, notice: 'Model was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @model.destroy
    redirect_to models_url, notice: 'Model was successfully destroyed.'
  end

  def for_make
    @models = Model.where(make_id: params[:make_id])
    render json: @models
  end

  private

  def set_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :make_id)
  end
end
