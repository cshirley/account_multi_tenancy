class AddOwnerIdToAccountMultiTenancyAccounts < ActiveRecord::Migration
  def change
    add_column :account_multi_tenancy_accounts, :owner_id, :integer
  end
end
