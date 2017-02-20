# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    @conversation = message_user.conversations.find(params[:conversation_id])
    stream_for @conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
