class QuestionsController < ApplicationController

  before_action :set_quiz

  def create
    @question = @quiz.questions.build(question_params)

    if @question.save
      flash[:success] = "Question has been created"
    else
      flash.now[:danger] = "Question has not been created"
    end
    redirect_to quiz_path(@quiz)
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

end
