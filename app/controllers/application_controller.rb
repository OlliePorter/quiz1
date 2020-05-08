class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.role?
      redirect_to :root, :alert => "Unfortunately you don't have the right access privileges."
    else
      redirect_to "/"
    end
  end
end
