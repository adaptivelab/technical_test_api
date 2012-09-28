class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :set_cors_access_header
  
  private
  def set_cors_access_header
    headers['Access-Control-Allow-Origin'] = '*'
  end
  
  # Used as a controller filter.
  def must_be_admin
    authenticate_user!
    
    unless current_user.is_admin?
      respond_to do |format|
        format.html { render template: "admin/users/unauthorized" }
        format.json { render json: { error: "Unauthorized action!" } }
      end
    end
  end
end
