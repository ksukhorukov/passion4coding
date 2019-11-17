# frozen_string_literal: true

class CategoriesController < ApplicationController
  resource_description do 
    short 'CRUD for Categories'
    formats ['json']
    error 404, 'Record not found.'
    error 422, 'Invalid record. Unprocessable entity.'
  end

  before_action :set_category, only: %i[show update destroy]

  api :GET, '/categories', 'Get all categories'
  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  api :GET, '/categories/:id', 'Show category'
  param :id, :number, required: true, desc: 'id of the requested category'
  # GET /categories/1
  def show
    render json: @category
  end

  api :POST, '/categories', 'Create category'
  param :name, String, required: true, desc: 'name of the new category'
  param :vertical_id, :number, required: true, desc: 'id of the parent vertical'
  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/categories/:id', 'Update category'
  param :id, :number, required: true, desc: 'id of the requested category'
  param :name, String, required: true, desc: 'name of the new category'
  param :vertical_id, :number, required: true, desc: 'id of the parent vertical'
  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/categories/:id', 'Delete category'
  param :id, :number, required: true, desc: 'id of the requested category'
  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def category_params
    params.permit(:id, :name, :state, :category_id, courses_params: %i[id name author state category_id _destroy])
  end
end
