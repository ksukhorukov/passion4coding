class Category < ApplicationRecord
	has_many :courses, dependent: :destroy
	belongs_to :vertical

	validates :name, presence: true
	validates :state, inclusion: [true, false]
end
