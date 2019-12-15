ActiveAdmin.register Publisher do
  menu parent: "Library"

  permit_params :name, :about, :website
  
end
