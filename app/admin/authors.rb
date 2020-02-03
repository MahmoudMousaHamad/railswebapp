ActiveAdmin.register Author do
  menu parent: "Library"

  controller do
    def create
      @author = Author.new(permitted_params[:author])
      @author.user_id = current_user.id
      @author.save
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
      input :published if authorized? :publish, author      
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :about
      row :published
    end
    panel "More from this Author" do
      div nested_resource_links_for(author, "author", ["books", "academic_papers"])
    end
  end
  
end
