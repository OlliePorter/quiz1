require 'rails_helper'

RSpec.feature "Listing answers of questions" do
  before do
    @john = User.create!(email: "john@example.com", password: "password", role: "super_admin")
    @quiz1 = Quiz.create(name:"CSS Quiz", description: "This is a quiz about CSS commands", user: @john)
    @question = @quiz1.questions.create!(text: "This is a test question")
    @question_answer1 = @question.question_answers.create!(text: "This is an answer", correct: true, question_id: @question.id)
    @question_answer2 = @question.question_answers.create!(text: "This is also an answer", correct: false, question_id: @question.id)
  end

  scenario "List all answers" do
    login_as @john
    visit "/"

    click_link @quiz1.name
    click_link @question.text

    expect(page).to have_content(@question_answer1.text)
    expect(page).to have_content(@question_answer2.text)
  end
end
