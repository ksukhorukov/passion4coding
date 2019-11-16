# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    it 'categories index' do
      category = FactoryBot.create(:category)
      get categories_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).first['Name']).to eq(category.name)
    end
  end

  describe 'POST /categorys' do
    it 'categories creation' do
      vertical = FactoryBot.create(:vertical)
      post categories_path, params: { name: 'test category name', state: 'active', vertical_id: vertical.id }
      expect(response).to have_http_status(201)
    end

    it 'fails if name of the course is not unique name across all other tables' do
      course = FactoryBot.create(:course)
      post categories_path, params: {
        name: course.name,
        author: 'test author',
        state: 'active',
        vertical_id: Vertical.first.id
      }
      expect(response).to have_http_status(422)
    end
  end

  describe 'UPDATE /categorys' do
    it 'updates categories' do
      category = FactoryBot.create(:category)
      params = category.attributes
      params[:name] = 'patched name'
      patch "/categories/#{category.id}", params: params
      response.should be_successful
      expect(JSON.parse(response.body)['Name']) == params[:name]
    end
  end

  describe 'SHOW /categories/:id' do
    it 'categories show' do
      category = FactoryBot.create(:category)
      params = category.attributes
      params[:name] = 'patched name'
      get "/categories/#{category.id}"
      response.should be_successful
      expect(JSON.parse(response.body)['Name']) == params[:name]
    end
  end

  describe 'DESTROY /categories/:id' do
    it 'categories destroy' do
      category = FactoryBot.create(:category)
      params = category.attributes
      params[:name] = 'patched name'
      delete "/categories/#{category.id}"
      response.should be_successful
      expect(Category.count) == 0
    end
  end
end
