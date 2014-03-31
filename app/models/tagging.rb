class Tagging < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  belongs_to :message

  attr_accessor :tag_name

  validates :tag_id, uniqueness: { scope: :message_id }
  validates :tag, presence: true
  validates :message, presence: true
  validates :user, presence: true

  before_validation :make_tag, if: -> { tag.nil? }

  private

  def make_tag
    self.tag = Tag.where("name ILIKE ?", "#{tag_name}%").first ||
               Tag.create(user: user, name: tag_name)
  end
end
