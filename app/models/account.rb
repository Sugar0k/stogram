# frozen_string_literal: true

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
    following_ids = Follower.where(follower_id: self.id).map(&:following_id)

    Account.where(id: following_ids)
  end

  def all_followers
    followers_ids = Follower.where(following_id: self.id).map(&:follower_id)

    Account.where(id: followers_ids)
  end

  def total_followers
    Follower.where(following_id: id).count
  end

  def total_following
    Follower.where(follower_id: id).count
  end
end
