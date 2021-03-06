ActiveAdmin.register Category do
  menu parent: "Countries"

  controller do
    def create
      @category = Category.new(permitted_params[:category])
      @category.user_id = current_user.id
      @category.save
      super
    end
  end

  permit_params :name, :about, :published

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
      input :published if authorized? :publish, resource      
    end
    actions
  end
  
end
