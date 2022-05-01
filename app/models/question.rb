class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user

  scope :published, -> { where(private: false) } 
  scope :privy, -> { where(private: true) } 
  
end
