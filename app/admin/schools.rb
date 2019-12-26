ActiveAdmin.register School do
  menu parent: "Countries"

  # TODO:
  belongs_to :college, optional: true

  controller do
    def create
      @school = School.new(permitted_params[:school])
      @school.user_id = current_user.id
      @school.save
      super
    end
  end

  permit_params :name, :professors, :about, :college_id, :university_id, :logo, :user_id, :published

  form do |f|
    inputs do
      input :name
      input :about
      input :professors
      input :college
      input :university
      input :logo, as: :file
      input :published if authorized? :publish, resource
    end
    actions
  end
end
