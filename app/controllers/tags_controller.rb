class TagsController < ApplicationController
  before_action :login_required

  def index
    @tags = Tag.where("name ILIKE ?", "#{params[:term]}%").pluck(:name)
    respond_to do |format|
      format.json { render json: @tags }
    end
  end

  def show
    names = (params[:name] || params[:id]).split(/,?\s/)
    tag_query = names.map{ |name| "tags.name ILIKE ?" }.join(' OR ')
    author_query = names.map{ |name| "messages.author ILIKE ?" }.join(' OR ')
    @messages_by_tag = Message.joins(:tags).where(tag_query, *names).distinct
    @messages_by_author = Message.where(author_query, *names.map{ |name| "#{name}%"}).where.not(id: @messages_by_tag.map(&:id))
  end
end
