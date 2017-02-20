class ConversationController < ApplicationController
  def show
    @conversation = current_user.conversations.find(params[:id])
  end
end
