class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, optional: true
  validates :content, presence: true
  scope :for_display, -> { where(conversation_id: nil).order(:created_at).last(50) }
end
