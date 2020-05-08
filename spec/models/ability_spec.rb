require "rails_helper"
require "cancan/matchers"

describe "User" do
  describe "abilities" do
    subject(:ability) { Ability.new(user) }
    let(:user){ nil }

    context "when is an super admin" do
      let(:user){ User.create(email: "test@test.com", password: "123", role: "super_admin") }

      it { is_expected.to be_able_to(:manage, Quiz.new, Question.new, QuestionAnswer.new) }
    end

    context "when is an admin" do
      let(:user){ User.create(email: "test@test.com", password: "123", role: "admin") }

      it { is_expected.not_to be_able_to(:create, Quiz.new) }
      it { is_expected.to be_able_to(:read, Quiz.new) }
      it { is_expected.not_to be_able_to(:update, Quiz.new) }
      it { is_expected.not_to be_able_to(:delete, Quiz.new) }

      it { is_expected.not_to be_able_to(:create, Question.new) }
      it { is_expected.to be_able_to(:read, Question.new) }
      it { is_expected.to be_able_to(:update, Question.new) }
      it { is_expected.not_to be_able_to(:delete, Question.new) }

      it { is_expected.not_to be_able_to(:create, QuestionAnswer.new) }
      it { is_expected.to be_able_to(:read, QuestionAnswer.new) }
      it { is_expected.to be_able_to(:update, QuestionAnswer.new) }
      it { is_expected.not_to be_able_to(:delete, QuestionAnswer.new) }
    end

    context "when is an admin" do
      let(:user){ User.create(email: "test@test.com", password: "123", role: "regular") }

      it { is_expected.not_to be_able_to(:create, Quiz.new) }
      it { is_expected.to be_able_to(:read, Quiz.new) }
      it { is_expected.not_to be_able_to(:update, Quiz.new) }
      it { is_expected.not_to be_able_to(:delete, Quiz.new) }

      it { is_expected.not_to be_able_to(:create, Question.new) }
      it { is_expected.to be_able_to(:read, Question.new) }
      it { is_expected.not_to be_able_to(:update, Question.new) }
      it { is_expected.not_to be_able_to(:delete, Question.new) }

      it { is_expected.not_to be_able_to(:create, QuestionAnswer.new) }
      it { is_expected.to be_able_to(:read, QuestionAnswer.new) }
      it { is_expected.not_to be_able_to(:update, QuestionAnswer.new) }
      it { is_expected.not_to be_able_to(:delete, QuestionAnswer.new) }
    end

    context "when is an admin" do
      let(:user){ User.create(email: "test@test.com", password: "123", role: "minimal") }

      it { is_expected.not_to be_able_to(:create, Quiz.new) }
      it { is_expected.to be_able_to(:read, Quiz.new) }
      it { is_expected.not_to be_able_to(:update, Quiz.new) }
      it { is_expected.not_to be_able_to(:delete, Quiz.new) }

      it { is_expected.not_to be_able_to(:create, Question.new) }
      it { is_expected.to be_able_to(:read, Question.new) }
      it { is_expected.not_to be_able_to(:update, Question.new) }
      it { is_expected.not_to be_able_to(:delete, Question.new) }

      it { is_expected.not_to be_able_to(:create, QuestionAnswer.new) }
      it { is_expected.not_to be_able_to(:read, QuestionAnswer.new) }
      it { is_expected.not_to be_able_to(:update, QuestionAnswer.new) }
      it { is_expected.not_to be_able_to(:delete, QuestionAnswer.new) }
    end
  end
end
