class CreateWishLists < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :giving_user, null: true, foreign_key: {to_table: :users}
      t.string :gift_name
      t.string :amazon_url
      t.string :gift_image
      t.string :status, default: "added"
      t.timestamps
    end
  end
end
