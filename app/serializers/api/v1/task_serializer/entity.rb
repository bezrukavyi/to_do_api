class Api::V1::TaskSerializer::Entity < ActiveModel::Serializer
  attributes :title, :position, :checked, :complete_at, :project_id
end
