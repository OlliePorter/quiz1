require 'rails_helper'

RSpec.feature "Listing quizzes" do
  before do
    @quiz1 = Quiz.create(name:"CSS Quiz", description: "This is a quiz about CSS commands")
    @quiz2 = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race")
  end

  scenario "List all quizzes" do
    visit "/"

    expect(page).to have_content(@quiz1.name)
    expect(page).to have_content(@quiz1.description)
    expect(page).to have_content(@quiz2.name)
    expect(page).to have_content(@quiz2.description)
    expect(page).to have_link(@quiz1.name)
    expect(page).to have_link(@quiz2.name)
  end
end
