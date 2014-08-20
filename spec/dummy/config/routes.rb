Rails.application.routes.draw do

  mount Tenant::Engine => "/"
end
