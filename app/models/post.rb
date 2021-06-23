class Post < ApplicationRecord
  default_scope { order created_at: :desc}
  include ImageUploader::Attachment(:image)
  belongs_to :account

  has_many :likes

  before_create :set_active

  scope :active, -> { where active: true }

  def set_active
    self.active = true
    self.total_likes_count = 0
    self.total_comments_count = 0
  end

end
