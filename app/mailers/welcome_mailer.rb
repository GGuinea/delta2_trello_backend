class WelcomeMailer < ApplicationMailer
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Samile Email")
  end
end
