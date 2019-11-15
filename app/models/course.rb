class Course < ApplicationRecord
	belongs_to :category

	validates :name, presence: true
	validates :author, presence: true
	validates :state, inclusion: [true, false]
end
