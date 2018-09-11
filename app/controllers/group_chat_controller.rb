class GroupChatController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.sorted
  end

  def create
    message = Message.create(user_uid: session.id, username: username, message: params[:message])
    publish(message)
    render json: message, status: :created
  end

  private

  def username
    session[:username] ||= "guest#{rand(1000)}"
  end

  def permited_params
    params.require(:group_chat).permit(:message)
  end

  def publish(message)
    connection = Bunny.new
    connection.start
    channel = connection.create_channel
    exchange = channel.fanout('logs')
    exchange.publish(message.id.to_s)
    connection.close
  end
end
