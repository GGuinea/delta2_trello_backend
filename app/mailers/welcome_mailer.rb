class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcom on Trello Delta 2 exile")
  end
end
