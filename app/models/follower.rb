# frozen_string_literal: true

class Follower < ApplicationRecord
  # has_and_belongs_to_many :accounts
  belongs_to :follower, foreign_key: :follower_id, class_name: 'Account'
  belongs_to :following, foreign_key: :following_id, class_name: 'Account'

  validates_uniqueness_of :follower_id, scope: :following_id
end
