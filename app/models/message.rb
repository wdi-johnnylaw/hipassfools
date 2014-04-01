class Message < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  scope :chronological, ->{ order(:time) }
end
