class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.references :event_managing_user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
