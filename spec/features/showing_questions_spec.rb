require "rails_helper"

RSpec.feature "Showing questions" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
    @question = @quiz.questions.create!(text: "This is a question")
  end

  scenario "Display an individual question" do
    login_as(@fred)

    visit '/'

    click_link @quiz.name
    click_link @question.text

    expect(page).to have_content(@question.text)
    expect(current_path).to eq(quiz_question_path(@quiz, @question))
  end
end

