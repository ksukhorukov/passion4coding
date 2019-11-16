require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses" do
    it "courses index" do
    	course = FactoryBot.create(:course)
      get courses_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).first["Name"]).to eq(course.name)
    end
  end

  describe "POST /courses" do
    it "courses creation" do
    	course = FactoryBot.create(:course)
      post courses_path, params: { 
      	name: 'test course name', 
      	author: 'test author', 
      	state: 'active', 
      	category_id: course.category.id 
      }
      
      expect(response).to have_http_status(201)
    end
  end

  describe "UPDATE /courses" do
    it "updates courses" do
    	course = FactoryBot.create(:course)
    	params = course.attributes
    	params[:name] = 'patched name'
    	patch "/courses/#{course.id}", params: params
      response.should be_successful
      expect(JSON.parse(response.body)['Name']) == params[:name]
    end
  end

  describe "SHOW /courses" do
    it "courses show" do
    	course = FactoryBot.create(:course)
    	params = course.attributes
    	params[:name] = 'patched name'
    	get "/courses/#{course.id}"
      response.should be_successful
      expect(JSON.parse(response.body)['Name']) == params[:name]
    end
  end

  describe "DESTROY /courses" do
    it "courses show" do
			course = FactoryBot.create(:course)
    	params = course.attributes
    	params[:name] = 'patched name'
    	delete "/courses/#{course.id}"
      response.should be_successful
      expect(Course.count) == 0
    end
  end
end
