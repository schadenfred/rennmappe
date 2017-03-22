class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protect_from_forgery # with: :exception

  def after_sign_up_path_for(resource)
    root_url
  end


end
