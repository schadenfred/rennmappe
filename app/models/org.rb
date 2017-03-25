class Org < ApplicationRecord

  has_many :checks
  has_many :orgs_users
  has_many :users, through: :orgs_users
end
