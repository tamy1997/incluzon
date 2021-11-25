# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
  #debugger
    user = User.find_for_authentication(email: params[:user][:email])
    if user.present?
        if user.verified==true
         super
       else
        redirect_to new_user_session_path
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :message, :password, :password_confirmation, :remember_me, :number, :address, :city, :state, :country, :pincode, :website, :authority_name, :pin, :verified])
  end
end
