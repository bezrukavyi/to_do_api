class Task < ApplicationRecord
  belongs_to :project
  has_many :attachments, dependent: :destroy

  acts_as_list scope: :project

  validates :title, length: { maximum: 100 }, presence: true
end
