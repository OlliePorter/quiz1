class Question < ApplicationRecord
  belongs_to :quiz
  has_many :question_answers, dependent: :destroy

  validates :text, presence: true

  def self.persisted
    where.not(id: nil)
  end
end
