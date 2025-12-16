class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :auto_login ]

  def home
  end

  def dashboard
  end

  def auto_login
    user = User.find_by(email: "léo@gmail.com")
    if user&.valid_password?("leorok")
      sign_in(user)
      session[:show_welcome_popup] = true
      redirect_to dashboard_path
    else
      redirect_to root_path, alert: "Connexion impossible"
    end
  end
end
