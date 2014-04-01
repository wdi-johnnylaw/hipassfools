class InvitationMailer < ActionMailer::Base
  default from: "WDI Instructor Team <#{ENV['HIPASSFOOLS_GMAIL_USERNAME']}>"

  def initial(invite)
    @invite = invite

    mail to: @invite.email, subject: 'Invitation to WDI HipChat Links'

    invite.update_attribute(:sent_at, Time.now)
  end
end
