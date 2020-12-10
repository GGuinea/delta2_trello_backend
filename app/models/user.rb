class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true, length: { in: 5..20, 
          wrong_length: "{count} characters is not allowed for username" }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20,
          wrong_length: "{count} characters is not allowed for password"}
  has_and_belongs_to_many :boards, :join_table => :members
end
