require "rails_helper"

RSpec.feature "Editing a question" do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
    @question = @quiz.questions.create!(text: "This is a question")
  end

  scenario "A question can be edited" do
    visit "/"

    click_link @quiz.name
    link = "//a[contains(@href, '/quizzes/#{@quiz.id}/questions/#{@question.id}') and .//text()='Edit Question']"
    find(:xpath, link).click

    fill_in "Text", with: "This is an updated question"
    click_button "Update Question"

    expect(page).to have_content("Question has been updated")
    expect(current_path).to eq(quiz_path(@quiz))
  end
end
