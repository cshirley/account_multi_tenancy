class CreateAccountMultiTenancyUsers < ActiveRecord::Migration
  def change
    create_table :account_multi_tenancy_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
