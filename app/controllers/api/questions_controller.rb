
class Api::QuestionsController < Api::ApplicationController
 
  before_action :get_question, only: [:show]
  before_action :get_questions, only: [:index]

  before_action :increment_tenant_request_count

  prepend_before_action :authenticate_with_api_key!

  def index
    render_no_content_if_blank @questions
  end

  def show
  end

  def search
    @questions = Question.search(params[:q]).page(params[:page])
    render_no_content_if_blank @questions
  end

  private

  def get_questions
    @questions = Question.published.includes(:user, {answers: [:user]}).order(:title).page(params[:page]) 
  end

  def get_question
    @question = Question.published.includes(:user, {answers: [:user]}).find(params[:id])
  end

end
