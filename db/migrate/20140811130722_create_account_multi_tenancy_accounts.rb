class CreateAccountMultiTenancyAccounts < ActiveRecord::Migration
  def change
    create_table :account_multi_tenancy_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
