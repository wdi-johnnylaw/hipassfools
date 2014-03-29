class MessagesController < ApplicationController
  def index
    if params.has_key?(:week)
      @week = params.delete('week').to_i - 1
      if @week < 0 || @week > WEEK_TOPICS.count - 1
        redirect_to params
      else
        @messages = Message.where(week: @week)
      end
    end
  end
end
