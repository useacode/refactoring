class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :topic
  belongs_to :user
end
