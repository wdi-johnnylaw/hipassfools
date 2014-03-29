class AuthorsController < ApplicationController
  def show
    @messages = Message.where(author: params[:id]).order(:date)
  end
end
