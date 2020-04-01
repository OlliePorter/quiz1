class QuizzesController < ApplicationController
  def index
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:success] = "Quiz has been created"
      redirect_to quizzes_path
    else
      flash[:danger] = "Quiz has not been created"
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, :description)
  end
end
