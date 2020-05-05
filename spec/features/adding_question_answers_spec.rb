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
    fill_in "New Answer", with: "George Washington"
    check "Tick if correct answer"

    click_button "Add Answer"
    expect(page).to have_content("Answer has been created")
    expect(page).to have_content("George Washington")
    expect(current_path).to eq(quiz_question_path(@quiz,@question))
  end
end

