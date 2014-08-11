require "warden"
require "dynamic_form"
module AccountMultiTenancy
  class Engine < ::Rails::Engine
    isolate_namespace AccountMultiTenancy
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    initializer "account_multi_tenancy.middleware.warden" do
      Rails.application.config.middleware.use Warden::Manager do |manager|
        manager.default_strategies :password

        manager.serialize_into_session do |user|
          user.id
        end

        manager.serialize_from_session do |id|
          AccountMultiTenancy::User.find(id)
        end
      end
    end

  end
end
