ActiveAdmin.register Supervisor do
  menu parent: "Library"
  
  permit_params :name, :about
  
  form do |f|
    inputs do 
      input :name
      input :about, as: :quill_editor
    end
  end

end
