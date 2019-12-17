ActiveAdmin.register Publisher do
  menu parent: "Library"

  controller do
    def create
      @publisher = Publisher.new(permitted_params[:publisher])
      @publisher.user_id = current_user.id
      @publisher.save
      super
    end
  end

  permit_params :name, :about, :website, :user_id
  
end
