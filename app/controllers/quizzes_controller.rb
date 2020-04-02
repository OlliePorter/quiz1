class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
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
      flash.now[:danger] = "Quiz has not been created"
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      flash[:success] = "Quiz has been updated"
      redirect_to @quiz
    else
      flash.now[:danger] = "Quiz has not been updated"
      render :edit
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, :description)
  end
end
