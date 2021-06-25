class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include ImageUploader::Attachment(:image)

  validates_uniqueness_of :username, :email

  has_many :posts
  has_many :likes
  # belongs_to :follower, foreign_key: :follower_id, class_name: "Account"
  # belongs_to :following, foreign_key: :following_id, class_name: "Account"

  def full_name
    "#{first_name} #{last_name}"
  end

  def all_followings
    # arr = Array.new
    # Follower.where(following_id: self.id).each do |f|
    #   arr.join f.follower
    # end
    # arr
  end

  def all_followers
    Follower.where(follower_id: self.id)
  end

  def total_followers
    Follower.where(following_id: self.id).count
  end

  def total_following
    Follower.where(follower_id: self.id).count
  end

end
