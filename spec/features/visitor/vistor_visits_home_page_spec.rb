require 'rails_helper'

describe 'Visitor' do
  it 'visitor sees landing page features' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('ROBO SPORTS LEAGUE')    
    expect(page).to have_content('Welcome to the Robot Sports League')    
    expect(page).to have_content('Sign in or register below!')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('SIGN UP')
  end
end