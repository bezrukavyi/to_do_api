class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  scope :with_tasks, -> { includes(:tasks) }

  validates :title, length: { maximum: 50 }, presence: true
end
