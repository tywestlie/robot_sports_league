class Player < ApplicationRecord
  self.primary_key = 'unique_id'

  before_create :set_unique_id
  belongs_to :team, optional: true

  validates :name, uniqueness: true, presence: true
  validates :unique_id, uniqueness: true

  def attr_sum
    self.strength + self.speed + self.agility
  end


  private
    def set_unique_id
      self.unique_id = SecureRandom.hex(3)
    end
end
