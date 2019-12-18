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

  form do |f|
    inputs do
      input :name
      input :about
      input :published if authorized? :publish, resource      
    end
    actions
  end
  
end
