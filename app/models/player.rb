class Player < ApplicationRecord
  belongs_to :team, optional: true
  validates :name, uniqueness: true, presence: true
  validates :unique_id, uniqueness: true, presence: true
end
