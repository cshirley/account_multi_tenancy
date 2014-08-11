require_dependency "account_multi_tenancy/application_controller"

module AccountMultiTenancy
  class AccountsController < ApplicationController
    def new
      @account = AccountMultiTenancy::Account.new
    end
    def create
      @account = AccountMultiTenancy::Account.create(account_params)
      flash[:success] = "Your account has been successfully created."
      redirect_to account_multi_tenancy.root_url
    end

  private
    def account_params
      params.require(:account).permit(:name)
    end

  end
end
