ActiveAdmin.register School do
  menu parent: "Countries"

  controller do
    def create
      @school = School.new(permitted_params[:school])
      @school.user_id = current_user.id
      @school.save
      super
    end
  end

  permit_params :name, :professors, :about, :college_id, :university_id, :logo, :user_id

  form do |f|
    inputs do
      input :name
      input :about
      input :professors
      input :college
      input :university
      input :logo, as: :file
    end
    actions
  end
end
