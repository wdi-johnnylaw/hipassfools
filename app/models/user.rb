class User < ActiveRecord::Base
  attr_reader :invitation_code
  belongs_to :invite
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :invite, presence: true, uniqueness: true

  delegate :name, to: :invite

  def invitation_code=(code)
    self.invite = Invite.find_by(code: code)
  end

  def messages
    Message.where(author: name)
  end
end
