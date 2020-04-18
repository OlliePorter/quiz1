class QuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
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
    @question = @quiz.questions.build
  end

  def update
    set_quiz
    if @quiz.user != current_user
      flash[:danger] = "You can only edit your own quiz."
      redirect_to root_path
    else
      if @quiz.update(quiz_params)
        flash[:success] = "Quiz has been updated"
        redirect_to @quiz
      else
        flash.now[:danger] = "Quiz has not been updated"
        render :edit
      end
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
    if @quiz.user != current_user
      flash[:danger] = "You can only edit your own quiz."
      redirect_to root_path
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, :description)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
