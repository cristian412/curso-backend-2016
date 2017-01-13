class Users::OmniauthCallbacksController < ApplicationController
	def facebook
		#raise params.to_yaml
		#raise request.env["omniauth.auth"].to_yaml
		@user = User.from_omniauth(request.env["omniauth.auth"])
		if @user.persisted?
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
		end

		render :edit

	end
end