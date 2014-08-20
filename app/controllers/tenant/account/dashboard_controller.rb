require_dependency "tenant/application_controller"

module Tenant
  class Account::DashboardController < Tenant::ApplicationController
    before_filter :authenticate_user!
  end
end
