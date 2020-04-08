class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendance, source: :attended_event
  validates :username, presence: true
end
