ActiveAdmin.register Supervisor do
  menu parent: "Library"
  
  permit_params :name, :about
  
end
