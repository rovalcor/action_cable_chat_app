class Conversation < ApplicationRecord
  has_many :messages

  def creator
    @creator ||= User.find(creator_id)
  end

  def target
    @target ||= User.find(target_id)
  end

  def self.find_by_participants(user_a_id, user_b_id)
    Conversation.where(creator_id: user_a_id, target_id: user_b_id)
                .or(Conversation.where(creator_id: user_b_id, target_id: user_a_id)).first
  end
end
