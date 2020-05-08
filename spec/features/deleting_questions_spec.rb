require "rails_helper"

RSpec.feature "Deleting a question" do

  before do
    @john = User.create!(email: "john@example.com", password: "password", role: "super_admin")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
    @question = @quiz.questions.create!(text: "This is a question")
  end

  scenario "A question can be deleted" do
  visit "/"

  click_link @quiz.name
  link = "//a[contains(@href, '/quizzes/#{@quiz.id}/questions/#{@question.id}') and .//text()='Delete Question']"
  find(:xpath, link).click

  expect(page).to have_content("Question has been deleted")
  expect(current_path).to eq(quiz_path(@quiz))
  end
end
