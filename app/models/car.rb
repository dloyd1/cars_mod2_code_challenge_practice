class Car < ApplicationRecord
  validates :name && :color, presence: true
  validates :miles, numericality: {greater_than_or_equal_to: 0}
  belongs_to :owner
end
