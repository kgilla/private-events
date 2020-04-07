class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'

  validates :username, presence: true
end
