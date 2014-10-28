class CustomerMailer < ActionMailer::Base
  def welcome_mail(customerprofile,customer)
      @user=customerprofile
      @username=customer
      @url= 'http://localhost:3000/logins/new'
      attachments['bird.jpg'] = File.read('app/assets/images/bird.jpg')
      mail(to: @username.email, subject: 'Registration Portal')
  end


  def pw_change(user)
    @user = user
    mail(:to => user.email, :subject => "Password Reset")
  end


end
