class Check < ApplicationRecord

  belongs_to :org
  belongs_to :parent, class_name: "Check"
  has_many :sub_checks, class_name: "Check", foreign_key: :parent_id

  def parent_org
    org ? org : parent.parent_org
  end
end
