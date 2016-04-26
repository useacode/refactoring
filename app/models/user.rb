class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }, uniqueness: true
  has_attached_file :avatar, styles: {:small  => "20x20#", :medium => "70x70#", :large => "160x160#"},
  :default_url => ":style/avatar.jpg"
  validates_attachment_content_type :avatar, content_type:/\Aimage\/.*\Z/
  has_many :topics, dependent: :destroy
  has_many :ideas, dependent: :destroy
end
