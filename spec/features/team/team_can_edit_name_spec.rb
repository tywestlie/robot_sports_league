require 'rails_helper'

describe 'Team Roster Edit Features', :js do
  it 'team can edit a roster' do
    team = create(:team)
    new_name = "Silly Kitties"


    allow_any_instance_of(ApplicationController).to receive(:current_team).and_return(team)

    visit dashboard_path

    click_on 'Edit Team Name'

    fill_in 'team[team_name]', with: new_name

    click_on 'Change Name'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(new_name)
  end
end
