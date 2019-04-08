class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def show
    @presenter = TeamPresenter.new(current_team)
  end

  def create
    team = Team.create(team_params)
    if team.save
      session[:team_id] = team.id
      redirect_to dashboard_path
    else
      flash[:error] = 'team already exists'
      render :new
    end
  end

  def create_roster
    current_team.auto_generate_roster
    redirect_back(fallback_location: root_path)
  end

  def clear_roster
    current_team.clear_roster
    redirect_back(fallback_location: root_path)
  end


  private

  def team_params
    params.require(:team).permit(:email, :team_name, :password)
  end

end
