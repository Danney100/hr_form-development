class CreateAccountUsers < ActiveRecord::Migration[6.0]

  def change
    create_table :account_users do |t|
      t.belongs_to :account
      t.belongs_to :user

      t.integer :user_role,  null: false,  default: 0

      t.timestamps
    end
  end

end
