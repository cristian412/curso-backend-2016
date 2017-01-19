class Users::OmniauthCallbacksController < ApplicationController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      @user.remember_me = true
      sign_in_and_redirect @user, event: :authentication
      return
    end

    session["devise.auth"] = request.env["omniauth.auth"]

    render :edit

  end

  def custom_sign_up
    @user = User.from_omniauth(session["devise.auth"])
    if @user.update(user_params)
      sign_in_and_redirect @user, event: :authentication
    else
      render :edit
    end

  end

  def failure
    redirect_to new_user_session_path, notice: "No pudimos loguearte. Error: #{params[:error_description]}. Motivo: #{params[:error_reason]}"
  end
 #http://localhost:3000/users/auth/facebook/callback?
 #error=access_denied &
 #error_code=200&
 #error_description=Permissions+error&
 #error_reason=user_denied&
 #state=005599f4df0e2a842c21078865827004de1aab8770ccf795
 #_=_


  private
    def user_params
      #Strong Params
      params.require(:user).permit(:name,:username,:email)
    end



end