class Conversation < ApplicationRecord
  has_many :messages

  def creator
    @creator ||= User.find(creator_id)
  end

  def target
    @taget ||= User.find(target_id)
  end
end
