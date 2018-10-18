class Owner < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than: 0 }
  has_many :cars
end
