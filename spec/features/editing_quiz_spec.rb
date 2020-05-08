require "rails_helper"

RSpec.feature "Editing a quiz" do

  before do
    @john = User.create!(email: "john@example.com", password: "password", role: "super_admin")
    login_as(@john)
    @quiz = Quiz.create(name:"Drag Race Quiz", description: "This is a quiz about the tv show Drag Race", user: @john)
  end

  scenario "A quiz can be edited" do
    visit '/'

    click_link @quiz.name
    click_link "Edit Quiz"

    fill_in "Name", with: "Super Drag Race Quiz"
    fill_in "Description", with: "This is a quiz about the AWESOME tv show Drag Race"
    click_button "Update Quiz"

    expect(page).to have_content("Quiz has been updated")
    expect(page.current_path).to eq(quiz_path(@quiz))
  end

  scenario "A quiz cannot be edited" do
    visit '/'

    click_link @quiz.name
    click_link "Edit Quiz"

    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Update Quiz"

    expect(page).to have_content("Quiz has not been updated")
    expect(page.current_path).to eq(quiz_path(@quiz))
  end
end
