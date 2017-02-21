class Conversation < ApplicationRecord
  has_many :messages

  def self.find_by_participants(user_1_id, user_2_id)
    Conversation.where(creator_id: user_1_id, target_id: user_2_id)
                .or(Conversation.where(creator_id: user_2_id, target_id: user_1_id)).first
  end
end
