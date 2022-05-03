class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user

  scope :published, -> { where(private: false) } 
  scope :privy, -> { where(private: true) } 
  
  paginates_per 5

  def self.search q
    Question.published
      .includes(:user, {answers: [:user]})
      .where("answers.body LIKE :q OR title LIKE :q", q: '%'+q+'%')
      .references(:answers)
      .distinct
  end

end
