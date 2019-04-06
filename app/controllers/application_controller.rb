class ApplicationController < ActionController::Base
  helper_method :current_team

  def current_team
    @current_team ||= Team.find(session[:team_id]) if session[:team_id]
  end
end
