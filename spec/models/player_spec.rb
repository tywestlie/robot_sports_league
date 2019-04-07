require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'class methods' do
    it 'creates unique id when it is created' do
      player = create(:player)
      player2 = create(:player)

      
      expect(player.unique_id.length).to eq(6)
      expect(player.unique_id).not_to eq(player2.unique_id)
    end
  end 
end
