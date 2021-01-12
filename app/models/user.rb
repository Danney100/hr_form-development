# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  before_create :build_new_account, if: Proc.new { |user| user.accounts.none? }

  private

  def build_new_account
    # Creates a new unpersisted AccountUser.
    account_user = AccountUser.new(user_role: "standard")
    # Create a new unpersisted Account associated to the AccountUser.
    account_user.build_account
    # Adds the built AccountUser to the User before save.
    self.account_users << account_user
    # On User save, the AccountUser and through it, the Account, will be saved (as a transaction).
  end

end # class User
