class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_message_counts

  def load_message_counts
    @message_counts = Message.order(:week).select('week, count(*) qty').group(:week)
  end
end
