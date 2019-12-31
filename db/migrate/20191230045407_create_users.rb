class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.references :account, null: true, foreign_key: true
      t.references :managing_account, null: true, foreign_key: {to_table: :accounts}

      t.timestamps
    end
  end
end
