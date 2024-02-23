class Team < ApplicationRecord
  has_many :teams_users
  has_many :users, through: :teams_users
end
