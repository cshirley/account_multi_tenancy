class AddOwnerIdToTenantAccounts < ActiveRecord::Migration
  def change
    add_column :tenant_accounts, :owner_id, :integer
  end
end
