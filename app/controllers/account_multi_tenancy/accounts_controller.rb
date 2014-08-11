require_dependency "account_multi_tenancy/application_controller"

module AccountMultiTenancy
  class AccountsController < ApplicationController
    def new
      @account = AccountMultiTenancy::Account.new
      @account.build_owner
    end
    def create
      @account = AccountMultiTenancy::Account.new(account_params)
      if @account.save
        env["warden"].set_user(@account.owner, :scope => :user)
        env["warden"].set_user(@account, :scope => :account)
        flash[:success] = "Your account has been successfully created."
        redirect_to account_multi_tenancy.root_url(:subdomain => @account.subdomain)
      else
        flash[:error] = "Sorry, your account could not be created."
        render :new
      end
    end

  private
    def account_params
      params.require(:account).permit(:name, :subdomain,
                                      {:owner_attributes => [
                                        :email,
                                        :password,
                                        :password_confirmation]})

    end

  end
end
