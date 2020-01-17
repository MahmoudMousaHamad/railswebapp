ActiveAdmin.register NewsTicker do
  
  permit_params :body
  
  controller do
    def update
      raise "You are not allowed to access this page!" if current_user.role != "superadmin"
      super
    end
  end

  form do |f|
    inputs do
      input :body, as: :quill_editor
    end
    actions
  end
end
