class CategorySerializer < ActiveModel::Serializer
	attributes :id, :name, :state, :verticals

  def state
  	object.state ? 'active' : 'disabled'
  end

  def verticals
  	object.vertical.id
  end
end
