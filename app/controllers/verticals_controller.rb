# frozen_string_literal: true

class VerticalsController < ApplicationController
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
  param :name, String, required: true, desc: 'new name of the new vertical'
  # PATCH/PUT /verticals/1
  def update
    if @vertical.update(vertical_params)
      render json: @vertical
    else
      render json: @vertical.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/verticals/:id", "Destroy vertical"
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

  # Only allow a trusted parameter "white list" through.
  def vertical_params
    params.permit(:id, :name, categories_params: %i[id name state vertical_id _destroy])
  end
end
