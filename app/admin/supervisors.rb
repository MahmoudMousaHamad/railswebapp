ActiveAdmin.register Supervisor do
  menu parent: "Library"
  
  controller do
    def create
      @supervisor = Supervisor.new(permitted_params[:supervisor])
      @supervisor.user_id = current_user.id
      @supervisor.save
      super
    end
  end

  permit_params :name, :about, :published, :user
  
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
      input :published
    end
    actions
  end

end
