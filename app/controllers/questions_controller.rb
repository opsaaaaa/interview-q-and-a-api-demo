class QuestionsController < ApplicationController
 
  before_action :get_question, only: [:show]
  before_action :get_questions, only: [:index]


  def index
    # respond_to do |format|
    #   format.json
    # end
    #binding.pry
  end

  def show
    # respond_to do |format|
    #   format.json
    # end
  end

  private

  def get_questions
    @questions = Question.published.includes(:user, {answers: [:user]}) 
  end

  def get_question
    @question = Question.published.includes(:user, {answers: [:user]}).find(params[:id])
  end
end
