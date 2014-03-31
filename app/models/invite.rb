class Invite < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
end
