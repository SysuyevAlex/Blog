# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
def get_admin
  	if((! user_signed_in?) || (current_user.role!=1))
		flash[:notice]="You don't have permission for this action"
		redirect_to(:controller=> "topics", :action=>"index")
	end
end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
