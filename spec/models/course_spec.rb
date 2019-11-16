require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'assosiations' do 
  	it { should belong_to(:courses).class.name == 'Course' }
  end

  describe 'validations' do
  	it { should validate_presence_of(:name) }
  	
  	it 'should ensure inclusion of :state in array [true, false]' do 
  		expect(subject).to validate_inclusion_of(:state).in_array([true, false])
  	end

    it 'must have unique name across all models' do 
      category = FactoryBot.create(:category)
      vertical = Vertical.first
      binded_name = category.name
      vertical.name = binded_name
      expect(vertical.save) == false
    end
  end
end
