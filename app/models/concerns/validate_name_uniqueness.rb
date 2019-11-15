module ValidateNameUniqueness
  extend ActiveSupport::Concern

  @@included_classes = []

  included do
    @@included_classes << self
    validate :name_unique_across_all_models
  end

  private

  def name_unique_across_all_models
    return if self.name.blank?
    @@included_classes.each do |klass|
      scope = klass.where(name: self.name)
      if self.persisted? && klass == self.class
        scope = scope.where.not(id: self.id)
      end
      if scope.any?
        self.errors.add :name, 'Name is already taken'
        break
      end
    end
  end
end
