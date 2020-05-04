class QuestionAnswer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct, inclusion: { in: [ true, false ] }

  default_scope { order(created_at: :desc) }
end
