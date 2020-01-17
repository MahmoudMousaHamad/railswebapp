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
