ActiveAdmin.register Discipline do
  menu parent: "Library"

  permit_params :name, :about, :photo

  form do |f|
    inputs do
      input :name
      input :about
      input :photo, as: :file
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :about
      row :photo do
        span image_tag image_path(main_app.url_for(discipline.photo)), class: "image-admin"
      end
    end 
  end
  
end
