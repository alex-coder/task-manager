class Task < ApplicationRecord
  validates_presence_of :name, :description, :user_id

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
