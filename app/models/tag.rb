class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :messages, through: :taggings

  validates :user, presence: true
  validates :name, uniqueness: true, presence: true
end
