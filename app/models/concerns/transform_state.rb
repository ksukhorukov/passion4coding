module TransformState
	extend ActiveSupport::Concern

	included do
		def transform_state
			state == 'active' ? true : false
		end
	end
end