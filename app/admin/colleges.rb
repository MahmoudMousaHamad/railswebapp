ActiveAdmin.register College do
  menu parent: "Countries"

  controller do
    def create
      @academic_paper = AcademicPaper.new(permitted_params[:academic_paper])
      @academic_paper.user_id = current_user.id
      @academic_paper.save
      super
    end
  end

  permit_params :name, :about, :university_id, :lat, :lng, :logo
  
  form do |f|
    inputs do
      input :name
      input :about
      input :university
      input :logo, as: :file
      input :lat
      input :lng
      div :id => "admin-add-map"
    end
    actions
  end
end
