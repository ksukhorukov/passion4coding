class CourseSerializer < ActiveModel::Serializer
	belongs_to :category

  attributes :id, :name, :author, :state

  def state
  	object.state ? 'active' : 'disabled'
  end
end
