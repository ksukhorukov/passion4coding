# frozen_string_literal: true

class CategoriesController < ApplicationController
  # Documentation
  resource_description do 
    short 'CRUD for Categories'
    formats ['json']
    error 404, 'Record not found.'
    error 422, 'Invalid record. Unprocessable entity.'
  end

  def_param_group :post_courses_nested do
    param :courses_params, Array, of: Hash, required: false, desc: "Nested attributes for courses" do
      param :name, String, desc: 'Name of the course', required: true
      param :author, String, desc: 'author of the course', required: true
      param :state, String, desc: "'active'/'disabled' state", required: true
      param :_destroy, :number, desc: '1 or 0, delete of keep', require: false
    end
  end

  def_param_group :update_courses_nested do
    param :courses_params, Array, of: Hash, required: false, desc: "Nested attributes for courses" do
      param :id, :number, desc: 'Id of the requested course', required: true
      param :name, String, desc: 'Name of the course', optional: true
      param :author, String, desc: 'author of the course', optional: true
      param :state, String, desc: "'active'/'disabled' state", optional: true
      param :_destroy, :number, desc: '1 or 0, delete of keep', optional: true
    end
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
  param :state, String, required: true, desc: "'active' or 'disabled' state of the course"
  param :vertical_id, :number, required: true, desc: 'id of the parent vertical'

  param_group :post_courses_nested
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
  param :name, String, optional: true, desc: 'name of the new category'
  param :state, String, optional: true, desc: "'active' or 'disabled' state of the course"
  param :vertical_id, :number, optional: true, desc: 'id of the parent vertical'

  param_group :update_courses_nested
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
    params.permit(:id, :name, :state, :vertical_id, courses_params: %i[id name author state category_id _destroy])
  end
end
