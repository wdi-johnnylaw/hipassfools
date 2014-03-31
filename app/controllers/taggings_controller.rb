class TaggingsController < ApplicationController
  before_action :login_required

  def create
    Tagging.create(tagging_params)
    respond_to do |format|
      format.json { render nothing: true }
    end
  end

  private

  def tagging_params
    params.require(:tagging).permit(:tag_name, :message_id).merge(user: current_user)
  end
end
