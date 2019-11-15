class Course < ApplicationRecord
	include TransformState
	include ValidateNameUniqueness
	
	before_save :transform_state
	
	belongs_to :category

	validates :name, presence: true, uniqueness: true
	validates :author, presence: true
	validates :state, inclusion: [true, false]
end
