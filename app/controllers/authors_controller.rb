class AuthorsController < ApplicationController
  before_action :login_required

  def show
    @messages = Message.where(author: params[:id]).order(:time)
  end
end
