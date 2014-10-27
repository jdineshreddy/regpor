class CustomerMailer < ActionMailer::Base
  def welcome_mail(customerprofile,customer)
      @user=customerprofile
      @username=customer
      @url= 'http://localhost:3000/logins/new'
      attachments['bird.jpg'] = File.read('app/assets/images/bird.jpg')
      mail(to: @user.email, subject: 'Registration Portal')
  end
end
