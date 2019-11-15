class Vertical < ApplicationRecord
	has_many :categories, dependent: :destroy
	has_many :courses, through: :categories

	accepts_nested_attributes_for :categories, 
																allow_destroy: true,
																reject_if: proc { |attributes| attributes['name'].blank? }

	validates :name, presence: true
end
