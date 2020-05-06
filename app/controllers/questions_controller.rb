class QuestionsController < ApplicationController

  before_action :set_quiz
  authorize_resource :quiz
  authorize_resource :question

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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find params[:id]
    if @question.update(question_params)
      flash[:success] = "Question has been updated"
      redirect_to quiz_path(@quiz)
    else
      flash.now[:danger] = "Question has not been updated"
      render :edit
    end
  end

  def show
    @question = Question.find params[:id]
    @question_answer = @question.question_answers.build
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
