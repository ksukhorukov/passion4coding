# frozen_string_literal: true

module TransformState
  extend ActiveSupport::Concern

  included do
    def transform_state
      state == 'active'
    end
  end
end
