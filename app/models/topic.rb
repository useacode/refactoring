class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :ideas, dependent: :destroy

  def self.published
    where(is_draft: false).order('created_at DESC')
  end

  def self.unpublished
    where(is_draft: true).order('created_at DESC')
  end
end
