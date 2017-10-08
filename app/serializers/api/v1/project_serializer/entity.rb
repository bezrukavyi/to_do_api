class Api::V1::ProjectSerializer::Entity < ActiveModel::Serializer
  attributes :title, :complete_at

  has_many :tasks, serializer: Api::V1::TaskSerializer::Entity
end
