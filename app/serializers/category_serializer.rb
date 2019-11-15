class CategorySerializer < ActiveModel::Serializer
	belongs_to :vertical

  attributes :id, :name, :state

  def state
  	object.state ? 'active' : 'disabled'
  end
end
