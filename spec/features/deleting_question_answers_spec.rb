require "rails_helper"

RSpec.feature "Deleting answers from questions" do

  before do
    @john = User.create!(email: "john@example.com", password: "password", role: "super_admin")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
    @question = @quiz.questions.create!(text: "This is a question")
    @question_answer = @question.question_answers.create!(text: "This is an answer", correct: true, question_id: @question.id)
  end

  scenario "An answer can be deleted" do
    visit "/"

    click_link @quiz.name
    click_link @question.text
    link = "//a[contains(@href, '/quizzes/#{@quiz.id}/questions/#{@question.id}/question_answers/#{@question_answer.id}') and .//text()='Delete Answer']"
    find(:xpath, link).click

    expect(page).to have_content("Answer has been deleted")
    expect(current_path).to eq(quiz_question_path(@quiz,@question))
  end
end

