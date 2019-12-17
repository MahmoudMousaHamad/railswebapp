ActiveAdmin.register BookCollection do
  menu parent: "Library"

  controller do
    def create
      @academic_paper = AcademicPaper.new(permitted_params[:academic_paper])
      @academic_paper.user_id = current_user.id
      @academic_paper.save
      super
    end
  end

  permit_params :name
  
end
