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

  permit_params :name, :about, :code, :discipline_id, :user_id
  
end
