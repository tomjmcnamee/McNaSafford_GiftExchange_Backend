class CreateWishLists < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :gift_name
      t.string :amazon_url
      t.string :gift_image
      t.string :status, default: "added"
      t.timestamps
    end
  end
end
