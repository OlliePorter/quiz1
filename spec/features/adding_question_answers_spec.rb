# require "rails_helper"
#
# RSpec.feature "Adding answers to questions" do
#
#   before do
#     @john = User.create(email: "john@example.com", password: "password")
#     @quiz = Quiz.create(name: "Historical events", description: "A quiz on major historical events", user: @john)
#     @question = @quiz.questions.create!(text: "Who was the first president of the United States?")
#     login_as(@john)
#     visit "/"
#     click_link @quiz.name
#     fill_in "New Question", with: "Who was the first president of the United States?"
#     click_button "Add Question"
#   end
#
#   scenario "permits a signed in user to add answers to a question" do
#
#     expect(page).to have_content("George Washington")
#     expect(page).to have_content("Thomas Jefferson")
#     expect(page).to have_content("Theodore Roosevelt")
#     expect(page).to have_content("Abraham Lincoln")
#     expect(current_path).to eq(quiz_path(@quiz))
#   end
# end
#
# fill_in "Answer 1", with: "George Washington"
# fill_in "Answer 1 answer", with: true
# fill_in "Answer 2", with: "Thomas Jefferson"
# fill_in "Answer 2 answer", with: false
# fill_in "Answer 3", with: "Theodore Roosevelt"
# fill_in "Answer 3 answer", with: false
# fill_in "Answer 4", with: "Abraham Lincoln"
# fill_in "Answer 4 answer", with: false
