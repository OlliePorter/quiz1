class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.role?
      redirect_to request.referrer, :alert => "Unfortunately you don't have the right access privileges."
    end
  end
end
