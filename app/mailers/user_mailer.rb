class UserMailer < ApplicationMailer
  default from: 'go@grafiki.com'

  def welcome_email user
    @user = user
    @url = 'http://grafiki.org/signin'
    mail(to: @user.email, subject: 'welcome to grafiki')
  end
end
