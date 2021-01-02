class Label < ApplicationRecord
  belongs_to :board
  belongs_to :card
end
