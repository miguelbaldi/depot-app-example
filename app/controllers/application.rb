# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	layout "store"
  helper :all # include all helpers, all the time
  before_filter :authorize, :except => :login

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'a9fc70f534015c8aacc7cf3575fa8649'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
    	session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in"
      redirect_to :controller => :admin, :action => :login
    end
  end


end

