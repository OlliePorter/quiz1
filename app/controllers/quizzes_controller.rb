class QuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    set_quiz
  end

  def update
    set_quiz
    if @quiz.update(quiz_params)
      flash[:success] = "Quiz has been updated"
      redirect_to @quiz
    else
      flash.now[:danger] = "Quiz has not been updated"
      render :edit
    end
  end

  def destroy
    set_quiz
    if @quiz.destroy
      flash[:success] = "Quiz has been deleted"
      redirect_to quizzes_path
    end
  end

  def edit
    set_quiz
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, :description)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
