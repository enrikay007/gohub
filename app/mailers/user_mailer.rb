class UserMailer < ApplicationMailer
  default from: 'sarankumar777@gmail.com'
 
  def changepass_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Your Password Has been Changed')
  end
end