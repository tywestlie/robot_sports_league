class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def show
    @team = current_team
  end

  def create  
    team = Team.create(team_params)
    if team.save
      session[:team_id] = team.id
      redirect_to dashboard_path
    else
      flash[:error] = 'team name already exists'
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:email, :team_name, :password)
  end

end