require 'rails_helper'
require 'support/macros'

RSpec.describe QuestionsController, type: :controller do
  describe "POST #create" do
    before do
      @john = User.create(email: "john@example.com", password: "password")
    end

    context "signed in user" do
      it "can create a question" do
        login_user @john
        quiz = Quiz.create(name: "Harry Potter Quiz",
                           description: "This is a quiz on the book & movie series Harry Potter",
                           user: @john)
        post :create, params: {question: {text: "What is Dumbledoors real name?"}, quiz_id: quiz.id }
        expect(flash[:success]).to eq("Question has been created")
      end
    end

    context "non signed in user" do
      it "is redirected to the sign in page" do
        login_user nil
        quiz = Quiz.create(name: "Harry Potter Quiz",
                           description: "This is a quiz on the book & movie series Harry Potter",
                           user: @john)
        post :create, params: {question: {text: "What is Dumbledoors real name?"}, quiz_id: quiz.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
