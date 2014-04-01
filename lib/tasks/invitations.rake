namespace :invitations do
  desc "Send out invitations"
  task :send => :environment do
    Invite.unsent.each do |invite|
      InvitationMailer.initial(invite).deliver!
    end
  end
end
