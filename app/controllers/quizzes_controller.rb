class QuizzesController < ApplicationController
  def index
  end

  def new
    @quiz = Quiz.new
  end
end
