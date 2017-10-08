class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  belongs_to :task
  validates :name, :file, presence: true
end
