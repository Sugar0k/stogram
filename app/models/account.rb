class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include ImageUploader::Attachment(:image)

  has_many :posts

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_followers
    0
  end

  def total_following
    1
  end
end
