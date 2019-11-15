class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :state, :categories
  
  def state
  	object.state ? 'active' : 'disabled'
  end

  def categories
  	object.category.id
  end
end
