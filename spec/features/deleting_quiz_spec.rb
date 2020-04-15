require "rails_helper"

RSpec.feature "Deleting a Quiz" do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
  end

  scenario do "A quiz can be deleted"
    visit "/"

    click_link @quiz.name
    click_link "Delete Quiz"

    expect(page).to have_content("Quiz has been deleted")
    expect(current_path).to eq(quizzes_path)
  end
end
