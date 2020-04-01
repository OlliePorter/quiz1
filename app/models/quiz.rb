class Quiz < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  default_scope { order(created_at: :desc) }
end
