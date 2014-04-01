class FavoritesController < ApplicationController
  before_action :login_required

  def index
    @favorite_messages = current_user.favorite_messages.chronological
  end

  def create
    Favorite.create(params.require(:favorite).permit(:message_id).merge(user: current_user))
  end

  def destroy
    Favorite.where(message_id: params[:id], user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to params[:redirect] }
    end
  end
end
