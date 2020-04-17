class Quiz < ApplicationRecord
  validates :name, presence: true

  validates :description, presence: true
  belongs_to :user

  has_many :questions, dependent: :destroy

  default_scope { order(created_at: :desc) }
end

