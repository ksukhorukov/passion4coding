require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'assosiations' do 
  	it { should have_many_to(:courses).class.name == 'Course' }
  	it { should belong_to(:verticals).class.name == 'Vertical' }
  end

  describe 'validations' do 
  	it { should validate_presence_of(:name) }
  	

  	it 'should ensure inclusion of :state in array [true, false]' do 
  		expect(subject).to validate_inclusion_of(:state).in_array([true, false])
  	end
  end
end
