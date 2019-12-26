ActiveAdmin.register College do
  menu parent: "Countries"

  # TODO:
  belongs_to :university, optional: true

  controller do
    def create
      @college = College.new(permitted_params[:college])
      @college.user_id = current_user.id
      @college.save
      super
    end
  end

  permit_params :name, :about, :university_id, :lat, :lng, :logo, :published
  
  form do |f|
    inputs do
      input :name
      input :about
      input :university
      input :logo, as: :file
      input :published if authorized? :publish, resource
      input :lat
      input :lng
      div :id => "admin-add-map"
    end
    actions
  end
end
