require 'rails_helper'

RSpec.describe Vertical, type: :model do
  describe 'assosiations' do 
  	it { should have_many_to(:categories).class.name == 'Category' }
  	it { should have_many_through(:courses).class.name == 'Course' }
  end

  describe 'validations' do 
  	it { should validate_presence_of(:name) }
  end
end
