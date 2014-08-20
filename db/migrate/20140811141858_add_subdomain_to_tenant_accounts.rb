class AddSubdomainToTenantAccounts < ActiveRecord::Migration
  def change
    add_column :tenant_accounts, :subdomain, :string
    add_index :tenant_accounts, :subdomain
  end
end
