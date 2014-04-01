class Invite < ActiveRecord::Base
  scope :unsent, -> { where(sent_at: nil) }
  validates :first_name, uniqueness: { scope: :last_name }, presence: true
  validates :email, uniqueness: true, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
