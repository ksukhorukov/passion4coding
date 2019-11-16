# frozen_string_literal: true

module ValidateNameUniqueness
  extend ActiveSupport::Concern

  @@included_classes = []

  included do
    @@included_classes << self
    validate :name_unique_across_all_models
  end

  private

  def name_unique_across_all_models
    return if name.blank?

    @@included_classes.each do |klass|
      scope = klass.where(name: name)
      scope = scope.where.not(id: id) if persisted? && klass == self.class
      if scope.any?
        errors.add :name, 'Name is already taken'
        break
      end
    end
  end
end
