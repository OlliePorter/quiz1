class Quiz < ApplicationRecord
  validates :name, presence: true

  validates :description, presence: true
  belongs_to :user

  default_scope { order(created_at: :desc) }
end

