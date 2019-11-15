class CategorySerializer < ActiveModel::Serializer
	attributes :Id, :Name, :State, :Verticals

	def Id
		object.id 
	end

	def Name
		object.name 
	end

  def State
  	object.state ? 'active' : 'disabled'
  end

  def Verticals
  	object.vertical.id
  end
end
