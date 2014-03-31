class TagsController < ApplicationController
  def index
    @tags = Tag.where("name ILIKE ?", "#{params[:term]}%").pluck(:name)
    respond_to do |format|
      format.json { render json: @tags }
    end
  end

  def show
    @tag = Tag.find_by("name ILIKE ?", params[:name] || params[:id])
  end
end
