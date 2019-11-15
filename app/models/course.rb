class Course < ApplicationRecord
	include CreationEmail
	include TransformState
	include ValidateNameUniqueness
	
	after_create :creation_email
	before_save :transform_state
	
	belongs_to :category

	validates :name, presence: true, uniqueness: true
	validates :author, presence: true
	validates :state, inclusion: [true, false]
end
