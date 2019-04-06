require 'rails_helper'

describe 'Visitor' do
  it 'visitor sees landing page features' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Robot Sports League')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end
end