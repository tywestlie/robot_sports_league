class SessionsController < ApplicationController
  def new
    @team ||= Team.new
  end

   def create
    team = Team.find_by(email: params[:session][:email])
    if team && team.authenticate(params[:session][:password])
      session[:team_id] = team.id
      redirect_to dashboard_path
    else
      flash[:error] = "Looks like your email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:team_id] = nil
    redirect_to root_path
  end
end