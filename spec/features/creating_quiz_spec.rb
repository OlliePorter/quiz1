require 'rails_helper'

RSpec.feature "Creating questions" do

  scenario "A new quiz is created" do
    visit "/"

    click_link "New Quiz"

    fill_in "Name", with: "Quiz 1"
    fill_in "Description", with: "This is a description for quiz 1"
    click_button "Create Quiz"

    expect(page).to have_content("Quiz has been created")
    expect(page.current_path).to eq(quizzes_path)
  end

  scenario "A quiz is fails to be created" do
    visit "/"

    click_link "New Quiz"

    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_button "Create Quiz"

    expect(page).to have_content("Quiz has not been created")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
