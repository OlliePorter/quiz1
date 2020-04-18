require "rails_helper"

RSpec.feature "Showing quizzes" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
  end

  scenario "A non signed in user is redirected to the login page" do
    visit '/'
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "A signed in owner can see both links" do
    login_as(@john)

    visit '/'

    click_link @quiz.name

    expect(page).to have_link("Edit Quiz")
    expect(page).to have_link("Delete Quiz")
  end

  scenario "Display an individual quiz" do
    login_as(@fred)

    visit '/'

    click_link @quiz.name

    expect(page).to have_content(@quiz.name)
    expect(page).to have_content(@quiz.description)
    expect(current_path).to eq(quiz_path(@quiz))
  end
end

