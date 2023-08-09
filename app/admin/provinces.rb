# app/admin/provinces.rb
ActiveAdmin.register Province do
  permit_params :name
  filter :name
  filter :created_at
end
