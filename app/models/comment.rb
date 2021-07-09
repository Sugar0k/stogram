# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates_presence_of :comment, :account_id, :post_id

  attr_accessor :return_to
end
