class Api::V1::ProjectSerializer::Entities < ActiveModel::Serializer
  attributes :title, :complete_at

  has_many :tasks, serializer: Api::V1::TaskSerializer::Entity
end
