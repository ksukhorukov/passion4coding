# frozen_string_literal: true

class CoursesController < ApplicationController
  # Documentation
  resource_description do 
    short 'CRUD for Courses'
    formats ['json']
    error 404, 'Record not found.'
    error 422, 'Invalid record. Unprocessable entity.'
  end

  before_action :set_course, only: %i[show update destroy]

  api :GET, '/courses', 'Get all courses'
  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  api :GET, '/courses/:id', 'Show course'
  param :id, :number, required: true, desc: 'id of the requested course'
  # GET /courses/1
  def show
    render json: @course
  end

  api :POST, '/courses', 'Create course'
  param :name, String, required: true, desc: 'name of the new course'
  param :state, String, required: true, desc: "'active' or 'disabled' state of the course"
  param :author, String, required: true, desc: 'author of the course'
  param :category_id, :number, required: true, desc: 'id of the parent category'
  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/courses/:id', 'Update course'
  param :id, :number, optional: true, desc: 'id of the requested course'
  param :name, String, optional: true, desc: 'name of the new course'
  param :state, String, optional: true, desc: "'active' or 'disabled' state of the course"
  param :author, String, optional: true, desc: 'author of the course'
  param :category_id, :number, optional: true, desc: 'id of the parent category'
  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/courses/:id', 'Delete course'
  param :id, :number, required: true, desc: 'id of the requested course'
  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.permit(:id, :name, :author, :state, :category_id)
  end
end
