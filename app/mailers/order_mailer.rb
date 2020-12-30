class OrderMailer < ApplicationMailer
	default from: 'shreyamundra90@gmail.com'
 
  def order_email
    @user = params[:user]
    @url  = 'http://127.0.0.1:3000/login'
    mail(to: @user.email, subject: 'Order Confirmed!!')
  end
end
