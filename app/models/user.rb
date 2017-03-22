class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :ownerships, inverse_of: :owner, foreign_key: :owner_id
  has_many :vehicles, through: :ownerships, as: :owner
  has_many :orgs_users
  has_many :orgs, through: :orgs_users

  accepts_nested_attributes_for :ownerships


end