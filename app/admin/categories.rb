ActiveAdmin.register Category do
  menu parent: "Countries"

  permit_params :name, :about
  
end
