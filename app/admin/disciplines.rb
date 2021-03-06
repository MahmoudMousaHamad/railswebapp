ActiveAdmin.register Discipline do
  menu parent: "Library"

  controller do
    def create
      @discipline = Discipline.new(permitted_params[:discipline])
      @discipline.user_id = current_user.id
      @discipline.save
      super
    end
  end

  permit_params :name, :about, :photo, :user_id, :published, :code

  index do
    selectable_column 
    id_column
    column :name
    toggle_bool_column :published if authorized? :publish
    column :user
    actions
  end
  
  form do |f|
    inputs do
      input :name
      input :about, as: :quill_editor
      input :photo, as: :file
      input :code
      input :published if authorized? :publish, resource
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :about
      row :photo do
        span image_tag image_path(main_app.url_for(discipline.photo)), class: "image-admin" if discipline.photo.attached?
      end
    end 
  end
  
end
