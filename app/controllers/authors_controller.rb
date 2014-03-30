class AuthorsController < ApplicationController
  def show
    @messages = Message.where(author: params[:id]).order(:time)
  end
end
