require 'rails_helper'

describe 'Team Roster Edit Features' do
  xit 'team can edit a roster' do
    team = create(:team)


    allow_any_instance_of(ApplicationController).to receive(:current_team).and_return(team)

    visit dashboard_path

    click_on 'Generate Roster'

    within(first('.card-action')) do
      click_on 'Replace Player'
    end

    expect(page).to eq()

  end
end
