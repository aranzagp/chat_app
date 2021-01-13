class GroupChatController < ApplicationController
  skip_before_action :verify_authenticity_token
  COLORS_ARRAY = ['#9ACD32', '#4287f5', '#F08080', '#D3D3D3', '#87CEFA']

  def index
    @messages = Message.sorted
  end

  def create
    message = Message.create(user_uid: session.id, username: username, message: params[:message], color: color)
    publish(message)
    render json: message, status: :created
  end

  private

  def username
    session[:username] ||= "guest#{rand(1000)}"
  end

  def color
    session[:color] ||= pick_color
  end

  def pick_color
    used_colors.each do |c|
      COLORS_ARRAY.delete_if { |color| color == c }
    end
    COLORS_ARRAY.sample
  end

  def used_colors
    Message.pluck('color').uniq
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
