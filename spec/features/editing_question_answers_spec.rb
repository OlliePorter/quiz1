require "rails_helper"

RSpec.feature "Editing an answer" do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
    @question = @quiz.questions.create!(text: "This is a question")
    @question_answer = @question.question_answers.create!(text: "This is an answer", correct: true, question_id: @question.id)
  end

  scenario "A question can be edited" do
    visit "/"

    click_link @quiz.name
    click_link @question.text
    link = "//a[contains(@href, '/quizzes/#{@quiz.id}/questions/#{@question.id}/question_answers/#{@question_answer.id}') and .//text()='Edit Answer']"
    find(:xpath, link).click

    fill_in "Edit Answer", with: "This is an updated answer"
    click_button "Update Answer"

    expect(page).to have_content("Answer has been updated")
    expect(current_path).to eq(quiz_question_path(@quiz,@question))
  end
end
