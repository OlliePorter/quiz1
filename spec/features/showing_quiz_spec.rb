require "rails_helper"

RSpec.feature "Showing quizzes" do
  before do
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race")
  end

  scenario "Display an individual quiz" do
    visit '/'

    click_link @quiz.name

    expect(page).to have_content(@quiz.name)
    expect(page).to have_content(@quiz.description)
    expect(current_path).to eq(quiz_path(@quiz))
  end
end

