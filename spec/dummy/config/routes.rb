Rails.application.routes.draw do

  mount AccountMultiTenancy::Engine => "/"
end
