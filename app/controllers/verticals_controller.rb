# frozen_string_literal: true

class VerticalsController < ApplicationController
  # Documentation

  def_param_group :post_categories_and_courses_nested do
    param :categories_params, Array, of: Hash, required: false, desc: 'Nested attributes for courses' do
      param :name, String, desc: 'Name of the course', required: true
      param :state, String, desc: "'active'/'disabled' state", required: true
      param :_destroy, :number, desc: '1 or 0, delete of keep', require: false
      param :courses_params, Array, of: Hash, required: false, desc: 'Nested attributes for courses' do
        param :name, String, desc: 'Name of the course', required: true
        param :author, String, desc: 'Author of the course', required: true
        param :state, String, desc: "'active'/'disabled' state", required: true
        param :_destroy, :number, desc: '1 or 0, delete of keep', require: false
      end
    end
  end

  def_param_group :update_categories_and_courses_nested do
    param :categories_params, Array, of: Hash, required: false, desc: 'Nested attributes for courses' do
      param :name, String, desc: 'Name of the course', required: true
      param :state, String, desc: "'active'/'disabled' state", required: true
      param :_destroy, Integer, desc: '1 or 0, delete of keep', require: false
      param :courses_params, Array, of: Hash, required: false, desc: 'Nested attributes for courses' do
        param :id, :number, desc: 'Id of the requested course', required: true
        param :name, String, desc: 'Name of the course', optional: true
        param :author, String, desc: 'Author of the course', optional: true
        param :state, String, desc: "'active'/'disabled' state", optional: true
        param :_destroy, :number, desc: '1 or 0, delete of keep', optional: true
      end
    end
  end

  resource_description do
    short 'CRUD for Verticals'
    formats ['json']
    error 404, 'Record not found.'
    error 422, 'Invalid record. Unprocessable entity.'
  end

  before_action :set_vertical, only: %i[show update destroy]

  api :GET, '/verticals', 'Get all verticals'
  # GET /verticals
  def index
    @verticals = Vertical.all

    render json: @verticals
  end

  api :GET, '/verticals/:id', 'Show vertical'
  param :id, :number, required: true, desc: 'id of the requested vertical'
  # GET /verticals/1
  def show
    render json: @vertical
  end

  api :POST, '/verticals', 'Create vertical'
  param :name, String, required: true, desc: 'name of the new vertical'

  param_group :post_categories_and_courses_nested
  # POST /verticals
  def create
    @vertical = Vertical.new(vertical_params)

    if @vertical.save
      render json: @vertical, status: :created, location: @vertical
    else
      render json: @vertical.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/verticals/:id', 'Update vertical'
  param :id, :number, required: true, desc: 'id of the requested vertical'
  param :name, String, optional: true, desc: 'new name of the new vertical'

  param_group :update_categories_and_courses_nested
  # PATCH/PUT /verticals/1
  def update
    if @vertical.update(vertical_params)
      render json: @vertical
    else
      render json: @vertical.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/verticals/:id', 'Destroy vertical'
  param :id, :number, required: true, desc: 'id of the requested vertical'
  # DELETE /verticals/1
  def destroy
    @vertical.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vertical
    @vertical = Vertical.find(params[:id])
  end

  def vertical_params
    params.permit(:id, :name, categories_params: [
                    :id, :name, :state, :vertical_id, :_destroy, courses_params: %i[
                      id name state author category_id _destroy
                    ]
                  ])
  end
end
