class Label < ApplicationRecord
  belongs_to :board
  has_and_belongs_to_many :cards, :join_table => :cards_labels
end
