class Question < ApplicationRecord
  belongs_to :quiz

  validates :text, presence: true

  def self.persisted
    where.not(id: nil)
  end
end
