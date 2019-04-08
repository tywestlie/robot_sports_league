require 'rails_helper'

describe 'Team Features' do
  it 'a team can auto generate a roster' do
    team = create(:team)

    allow_any_instance_of(ApplicationController).to receive(:current_team).and_return(team)

    visit dashboard_path

    expect(page).to have_content('Generate Roster')

    click_on 'Generate Roster'
    
    within(first('.rosters')) do
      expect(page).to have_css('.player')
    end
  end
end