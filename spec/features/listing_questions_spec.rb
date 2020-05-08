require 'rails_helper'

RSpec.feature "Listing questions" do
  before do
    @john = User.create!(email: "john@example.com", password: "password", role: "super_admin")
    @quiz1 = Quiz.create(name:"CSS Quiz", description: "This is a quiz about CSS commands", user: @john)
    @question1 = @quiz1.questions.create!(text: "This is a test question")
    @question2 = @quiz1.questions.create!(text: "This is a second test question")
  end

  scenario "List all questions" do
    login_as @john
    visit "/"

    click_link @quiz1.name

    expect(page).to have_content(@question1.text)
    expect(page).to have_content(@question2.text)
  end
end
