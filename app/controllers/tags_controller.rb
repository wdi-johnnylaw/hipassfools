class TagsController < ApplicationController
  def index
    @tags = Tag.where("name ILIKE ?", "#{params[:term]}%").pluck(:name)
    respond_to do |format|
      format.json { render json: @tags }
    end
  end
end
