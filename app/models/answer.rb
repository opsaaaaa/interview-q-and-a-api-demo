class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  scope :published, -> { joins(:question).where(question: {private: false}) } 
  scope :privy, -> { joins(:question).where(question: {private: true}) }

end
