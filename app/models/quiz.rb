class Quiz < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
