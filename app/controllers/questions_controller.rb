class QuestionsController < ApplicationController

  before_action :set_quiz

  def create
    if current_user
      @question = @quiz.questions.build(question_params)
      if @question.save
        flash[:success] = "Question has been created"
      else
        flash.now[:danger] = "Question has not been created"
      end
      redirect_to quiz_path(@quiz)
    else
      flash[:danger] = "Please sign in or sign up first"
      redirect_to new_user_session_path
    end
  end

  def destroy
    @question = Question.find params[:id]
    if @question.destroy
      flash[:success] = "Question has been deleted"
      redirect_to quiz_path(@quiz)
    end
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

end
