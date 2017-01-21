class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user

  mount_uploader :attachment, AttachmentUploader

  state_machine :initial => :new do
    state :new
    state :started
    state :finished
  end

  def self.states
    state_machine.states
  end
end
