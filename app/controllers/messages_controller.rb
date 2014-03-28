class MessagesController < ApplicationController
  def index
    @messages = Message.where(week: params[:week])
    @message_counts = Message.order(:week).select('week, count(*) qty').group(:week)
  end
end
