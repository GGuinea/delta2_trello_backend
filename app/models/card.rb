class Card < ApplicationRecord
  belongs_to :column
  has_and_belongs_to_many :labels, :join_table => :cards_labels
  has_many :tasks
end
