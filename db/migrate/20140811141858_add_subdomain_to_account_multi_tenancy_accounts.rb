class AddSubdomainToAccountMultiTenancyAccounts < ActiveRecord::Migration
  def change
    add_column :account_multi_tenancy_accounts, :subdomain, :string
    add_index :account_multi_tenancy_accounts, :subdomain
  end
end
