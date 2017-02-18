class LinksController < ApplicationController
  before_action :require_login

  def index

  end

  def require_login
    unless logged_in?
      flash[:errors] = 'need to be logged in bruh'
      redirect_to new_session_url
    end
  end

end
