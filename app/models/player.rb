class Player < ApplicationRecord
  self.primary_key = 'unique_id'

  belongs_to :team, optional: true

  validates :name, uniqueness: true
  validates :unique_id, uniqueness: true
  enum role: [:free_agent, :alternate, :starter]

  def attribute_sum
    self.strength + self.speed + self.agility
  end

  def self.create_player(team)
    attributes = unique_attributes(team)
    team.players.create(unique_id: generate_unique_id,
                        name: generate_unique_name,
                        strength: attributes[:strength],
                        speed: attributes[:speed],
                        agility: attributes[:agility])
  end


  private

    def self.generate_unique_id
      SecureRandom.hex(3)
    end

    def self.generate_unique_name
      Faker::Name.unique.name
    end

    def self.unique_attributes(team)
      players_attribute_sums = team.players.map do |player|
        player.attribute_sum
      end

      attributes = {}

      attributes[:strength] = rand(1..50)
      attributes[:speed] = rand(1..50)
      attributes[:agility] = rand(1..50)

      sum = attributes[:strength] + attributes[:speed] + attributes[:agility]

      if sum > 100
        unique_attributes(team)
      else
        return attributes
      end
    end
end
