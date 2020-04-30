require "rails_helper"

RSpec.feature "Adding answers to questions" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    @quiz = Quiz.create(name: "Historical events", description: "A quiz on major historical events", user: @john)
    @question = @quiz.questions.create!(text: "Who was the first president of the United States again?")
    login_as(@john)
    visit "/"
    click_link @quiz.name
    fill_in "New Question", with: "Who was the first president of the United States?"
    click_button "Add Question"
  end

  scenario "permits a signed in user to add answer to a question" do
    click_link @question.text
    fill_in "Answer", with: "George Washington"
    fill_in "Answer result", with: true

    click_button "Add Question Answer"

    expect(page).to have_content("Question Answer has been created")
    expect(page).to have_content("George Washington")
    expect(page).to have_content("Thomas Jefferson")
    expect(page).to have_content("Theodore Roosevelt")
    expect(page).to have_content("Abraham Lincoln")
    expect(current_path).to eq(quiz_questions_path(@question))
  end
end
