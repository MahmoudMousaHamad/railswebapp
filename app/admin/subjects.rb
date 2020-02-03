ActiveAdmin.register Subject do
  menu parent: "Library"

  controller do
    def create
      @subject = Subject.new(permitted_params[:subject])
      @subject.user_id = current_user.id
      @subject.save
      super
    end
  end

  permit_params :name, :about, :code, :discipline_id, :user_id, :published

  index do
    selectable_column 
    id_column
    column :name
    toggle_bool_column :published if authorized? :publish
    column :user
    actions
  end

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
      input :code
      input :discipline
      input :published if authorized? :publish, resource
    end
    actions
  end
  
end
