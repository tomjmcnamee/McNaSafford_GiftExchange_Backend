class User < ApplicationRecord
  has_many :event_gift_givers
  has_many :event_gift_getters
  has_many :events
  has_many :wish_lists
  belongs_to :account, foreign_key: 'managing_account_id', optional: true
  belongs_to :account, foreign_key: 'account_id', optional: true

  validates :first_name, :last_name, :dob, presence: true
  validates :account_id, uniqueness: true, allow_blank: true

end
