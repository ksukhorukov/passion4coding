class CourseSerializer < ActiveModel::Serializer
  attributes :Id, :Name, :Author, :State, :Categories
  
  def Id
  	object.id 
  end

  def Name
  	object.name 
  end

  def State
  	object.state ? 'active' : 'disabled'
  end

  def Author
  	object.author 
  end

  def Categories
  	object.category.id
  end
end
