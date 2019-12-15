ActiveAdmin.register Subject do
  menu parent: "Library"

  permit_params :name, :about, :code, :discipline_id
  
end
