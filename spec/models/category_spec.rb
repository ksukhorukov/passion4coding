require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'assosiations' do 
  	it { should have_many_to(:courses).class.name == 'Course' }
  	it { should belong_to(:verticals).class.name == 'Vertical' }
  end

  describe 'validations' do 
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:state) }
  end
end
