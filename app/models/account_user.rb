# == Schema Information
#
# Table name: account_users
#
#  id         :bigint           not null, primary key
#  account_id :bigint
#  user_id    :bigint
#  user_role  :integer          default("standard"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AccountUser < ApplicationRecord

  DEFAULT_USER_ROLE = "standard"

  belongs_to :account
  belongs_to :user

  # TODO: callback with default. see other project
  validates :user_role,
    presence: true

  before_validation :set_user_role_if_missing

  enum user_role: {
    standard: 0,
    admin: 1
  }

  private

  def set_user_role_if_missing
    if !user_role.present?
      self.user_role = DEFAULT_USER_ROLE
    end
  end

end # class AccountUser
