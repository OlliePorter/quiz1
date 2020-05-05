require 'rails_helper'

RSpec.describe QuestionAnswersController, type: :controller do
  it 'creates a new question answer' do
    question_answer = QuestionAnswer.create(text: 'Test answer', correct: true)
    expect(question_answer.text).to eq("Test answer")
  end
end
