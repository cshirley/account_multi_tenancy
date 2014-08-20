class CreateTenantAccounts < ActiveRecord::Migration
  def change
    create_table :tenant_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
