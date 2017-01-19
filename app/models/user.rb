class User < ApplicationRecord
  extend Enumerize

  has_secure_password

  enumerize :role, in: [:user, :admin]

  validates :email, presence: true, uniqueness: true
end
