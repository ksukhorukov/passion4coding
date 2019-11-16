# frozen_string_literal: true

class VerticalSerializer < ActiveModel::Serializer
  attributes :Id, :Name

  def Id
    object.id
  end

  def Name
    object.name
  end
end
