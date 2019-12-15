ActiveAdmin.register Author do
  menu parent: "Library"

  permit_params :name, :about
  
end
