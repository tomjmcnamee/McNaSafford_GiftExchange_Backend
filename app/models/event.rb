class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'event_managing_user_id'
  has_many :event_gift_givers
  has_many :event_gift_getters
end
