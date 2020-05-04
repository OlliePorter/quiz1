class QuestionAnswersController < ApplicationController

  before_action :set_question

  def create
    @question_answer = @question.question_answers.build(question_answer_params)

    if @question_answer.save
      flash[:success] = "Answer has been created"
    else
      flash.now[:danger] = "Answer has not been created"
    end

    redirect_to quiz_question_path(@quiz,@question)
  end

  private

  def question_answer_params
    params.require(:question_answer).permit(:text, :correct)
  end

  def set_question
    @question = Question.find(params[:question_id])
    @quiz = Quiz.find(params[:quiz_id])
  end

end
