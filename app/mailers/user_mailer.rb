class UserMailer < ApplicationMailer

	def confirm_mail
		#debugger
    @user = params[:user]

    mail(to: @user.email, subject: "Your Account OTP")
  end

  def confirm_student
  	@student = params[:student]

  	mail(to: @student.email, subject: "You have been added to the group")
  end
end
