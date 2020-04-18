require 'rails_helper'

RSpec.feature "Listing quizzes" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @quiz1 = Quiz.create(name:"CSS Quiz", description: "This is a quiz about CSS commands", user: @john)
    @quiz2 = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
  end

  scenario "List all quizzes" do
    login_as @john
    visit "/"

    expect(page).to have_content(@quiz1.name)
    expect(page).to have_content(@quiz1.description)
    expect(page).to have_content(@quiz2.name)
    expect(page).to have_content(@quiz2.description)
    expect(page).to have_link(@quiz1.name)
    expect(page).to have_link(@quiz2.name)
  end
end
