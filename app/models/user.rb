class User < ApplicationRecord
  extend Enumerize

  has_secure_password

  enumerize :role, in: [:user, :admin]

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  has_many :tasks, dependent: :destroy

  def fetch_tasks
    role.admin? ? Task.all : tasks
  end
end
