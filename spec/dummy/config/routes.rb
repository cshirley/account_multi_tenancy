Rails.application.routes.draw do

  mount AccountMultiTenancy::Engine => "/account_multi_tenancy"
end
