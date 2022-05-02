class DashboardsController < ApplicationController

  def home
    get_stats
    get_tenants
  end

  private

  def get_stats
    @stats = {
      users: User.count, 
      questions: Question.published.count,
      answers: Answer.published.count
    }
  end

  def get_tenants
    @tenants = Tenant.select(:name, :request_count)
  end

end
