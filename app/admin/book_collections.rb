ActiveAdmin.register BookCollection do
  menu parent: "Library"

  permit_params :name
  
end
