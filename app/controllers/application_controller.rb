# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password      
  
  # Methods to extract objects based on session store
   def store_current_project(project)
     session[:current_project_id] = project.id
   end

   # Methods to extract objects based on session store
   def current_project
     Project.find(session[:current_project_id]) if session[:current_project_id]
   end

   # Methods to clear session store
    def clear_current_project
      session[:current_project_id] = nil
    end
  
end
