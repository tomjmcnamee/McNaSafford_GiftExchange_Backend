class WishList < ApplicationRecord
  belongs_to :user, foreign_key: 'giving_user_id', optional: true
  belongs_to :user, foreign_key: 'user_id'

  validates :user_id, :gift_name, :amazon_url, :gift_image, presence: true
end
