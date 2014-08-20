require_dependency "tenant/application_controller"

module Tenant
  class Account::SessionsController < Tenant::ApplicationController
    def new
      @user = User.new
    end
    def create
      if env["warden"].authenticate(:scope => :user)
        flash[:notice] = "You are now signed in."
        redirect_to root_path
      else
        @user = User.new
        flash[:error] = "Invalid email or password."
        render :action => "new"
      end
    end
  end
end
