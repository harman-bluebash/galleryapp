class UserMailer < ApplicationMailer
    default from: 'kambozharman2@gmail.com'

     def welcome_email
      @user = params[:user]
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
     
    def destroy_mail
      @user = params[:user]
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
