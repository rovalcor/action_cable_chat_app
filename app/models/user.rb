class User < ApplicationRecord
  has_many :messages
  NAME_REGEX = /\w+/
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A#{NAME_REGEX}\z/i },
                       length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def conversations
    Conversation.where(creator_id: id).or(Conversation.where(target_id: id))
  end
end
