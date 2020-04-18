require 'rails_helper'
require 'support/macros'

RSpec.describe QuizzesController, type: :controller do

  describe "GET #edit" do
    before do
      @john = User.create(email: "john@example.com", password: "password")
    end

    context "owner is allowed to edit their quizzes" do
      it "renders the edit template" do
        login_user @john
        quiz = Quiz.create(name: "first quiz", description: "body of first quiz", user: @john)

        get :edit, params: { id: quiz.id }
        expect(response).to render_template :edit
      end
    end

    context "non-owner is not allowed to edit other users quizzes" do
      it "redirects to the root path" do
        @fred = User.create(email: "fred@example.com", password: "password")

        login_user @fred

        quiz = Quiz.create(name: "first quiz", description: "body of first quiz", user: @john)

        get :edit, params: { id: quiz.id }
        expect(response).to redirect_to(root_path)
        message = "You can only edit your own quiz."
        expect(flash[:danger]).to eq message
      end
    end

    it "returns http success" do
      @fred = User.create(email: "fred@example.com", password: "password")
      login_user @fred
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
