require "rails_helper"

RSpec.feature "Deleting a question" do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
    @question = Question.create(text:"This is a question")
  end

  scenario do "A question can be deleted"
  visit "/"

  click_link "Delete Question"

  expect(page).to have_content("Question has been deleted")
  expect(current_path).to eq(quizzes_path)
  end
end
