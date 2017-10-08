class Api::V1::TaskSerializer::Entities < ActiveModel::Serializer
  attributes :title, :position, :checked, :complete_at, :project_id
end
