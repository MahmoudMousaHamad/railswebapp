ActiveAdmin.register Subject do

  permit_params :name, :about, :code, :discipline_id
  
end
