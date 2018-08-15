class GroupChatController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    puts params[:message]
    @message = Message.new(user_uid: session.id, username: params[:username], message: params[:message])
    @message.save
    render :index
  end

  private

  def permited_params
    params.require(:group_chat).permit(:username, :message)
  end
end
