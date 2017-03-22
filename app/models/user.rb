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

  def temporary_name
    localpart = email.split('@').first.split(/\.|\d|\_/)
    localpart.size > 1 ? localpart.map(&:capitalize).join(" ").gsub(/\s+/, ' ') : "Driver"
  end

  def temporary_given_name
    temporary_name.split(/\s/).first.capitalize
  end

  def reconciled_name
    if name.nil? && given_name.nil?
      temporary_name
    elsif  name.nil? && given_name
      given_name
    else
      name
    end
  end

  def reconciled_given_name
    given_name.nil? ? reconciled_name.split(" ").first : given_name
  end
end