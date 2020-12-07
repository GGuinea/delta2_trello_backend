class Board < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :members
  has_many :columns
end
