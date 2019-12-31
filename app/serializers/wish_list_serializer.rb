class WishListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :gift_name, :amazon_url, :status
end
