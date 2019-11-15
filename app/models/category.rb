class Category < ApplicationRecord
	include CreationEmail
	include TransformState
	include ValidateNameUniqueness

	after_create :creation_email
	before_save :transform_state

	has_many :courses, dependent: :destroy
	belongs_to :vertical

	accepts_nested_attributes_for :courses, allow_destroy: true,
																reject_if: proc { |attributes| attributes['name'].blank? }
																
	validates :name, presence: true, uniqueness: true
	validates :state, inclusion: [true, false]
end
