class OrgsUser < ApplicationRecord

  belongs_to :org
  belongs_to :user
end
