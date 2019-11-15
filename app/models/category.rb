class Category < ApplicationRecord
	belongs_to :vertical
	has_many :courses

	validates :name, presence: true
	validates :state, inclusion: [true, false]
end
