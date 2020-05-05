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

  def edit
    @question_answer = QuestionAnswer.find params[:id]
  end

  def update
    @question_answer = QuestionAnswer.find params[:id]
    if @question_answer.update(question_answer_params)
      flash[:success] = "Answer has been updated"
      redirect_to quiz_question_path(@quiz,@question)
    else
      flash.now[:danger] = "Answer has not been updated"
      render :edit
    end
  end

  def destroy
    @question_answer = QuestionAnswer.find params[:id]
    if @question_answer.destroy
      flash[:success] = "Answer has been deleted"
      redirect_to quiz_question_path(@quiz,@question)
    end
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
