require_dependency "account_multi_tenancy/application_controller"

module AccountMultiTenancy
  class Account::DashboardController < AccountMultiTenancy::ApplicationController
    before_filter :authenticate_user!
  end
end
