class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :category_list

  def category_list
    Category.all
  end

  def not_authenticated
    redirect_to login_url
  end

  def require_admin
    if logged_in?
      redirect_to login_url unless current_user.admin
    else
      redirect_to login_url
    end
  end
end