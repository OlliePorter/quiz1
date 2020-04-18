require "rails_helper"

RSpec.feature "Adding questions to quizzes" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @quiz = Quiz.create(name: "Historical events", description: "A quiz on major historical events", user: @john)
  end

  scenario "permits a signed in user to add a question" do
    login_as(@fred)

    visit "/"
    click_link @quiz.name
    fill_in "New Question", with: "Who was the first president of the United States?"
    click_button "Add Question"

    expect(page).to have_content("Question has been created")
    expect(page).to have_content("Who was the first president of the United States?")
    expect(current_path).to eq(quiz_path(@quiz))
  end
end
