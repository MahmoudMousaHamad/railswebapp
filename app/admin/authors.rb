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
  
end
