class Account < ApplicationRecord
  has_many :users

  has_secure_password

  validates :email_address, :password, presence: true
  validates :email_address, uniqueness: { case_sensitive: false }

end
