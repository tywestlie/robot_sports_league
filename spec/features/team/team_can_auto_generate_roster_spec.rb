require 'rails_helper'

describe 'Team Features' do

  it 'a team can auto generate a roster and clear roster' do
    team = create(:team)

    allow_any_instance_of(ApplicationController).to receive(:current_team).and_return(team)

    visit dashboard_path

    click_on 'Generate Roster'

    within(first('.roster')) do
      expect(page).to have_css('.starters')
      expect(page).to have_css('.alternates')
    end

    click_on 'Clear Roster'
    
    expect(team.roster.empty?).to eq(true)
  end

end
