class ConversationsController < ApplicationController
  before_action :set_conversation, except: :create

  def create
    @conversation = Conversation.find_by_participants(current_user.id, params[:target_id])

    if @conversation
      redirect_to @conversation
    else
      @conversation = Conversation.new(creator_id: current_user.id, target_id: params[:target_id])

      if @conversation.save
        redirect_to @conversation
      else
        flash[:danger] = "Could not create conversation"
        redirect_to root_url
      end
    end
  end

  def create_message
    @message = current_user.messages.build
    @message.content = params[:content]
    @message.conversation = @conversation

    if @message.save
      ConversationsChannel.broadcast_to(
        @conversation,
        message: render(partial: 'messages/message', locals: { message: @message })
      )

      head :ok
    else
      render 'index'
    end
  end

  def show
  end

  private

  def set_conversation
    @conversation = current_user.conversations.find(params[:id])
  end
end
