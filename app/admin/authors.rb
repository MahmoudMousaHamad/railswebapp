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

  form do |f|
    inputs do
      input :name
      input :about
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
