class Api::V1::AttachmentSerializer < ActiveModel::Serializer
  attributes :name, :file, :task_id
end
