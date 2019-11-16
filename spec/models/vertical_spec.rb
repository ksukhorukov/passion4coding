# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vertical, type: :model do
  describe 'assosiations' do
    it { should have_many_to(:categories).class.name == 'Category' }
    it { should have_many_through(:courses).class.name == 'Course' }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    it 'must have unique name across all models' do
      category = FactoryBot.create(:category)
      vertical = Vertical.first
      binded_name = category.name
      vertical.name = binded_name
      expect(vertical.save) == false
    end
  end
end
