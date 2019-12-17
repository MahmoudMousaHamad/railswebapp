ActiveAdmin.register Conference do
  menu parent: "Countries"

  controller do
    def create
      @academic_paper = AcademicPaper.new(permitted_params[:academic_paper])
      @academic_paper.user_id = current_user.id
      @academic_paper.save
      super
    end
  end

  permit_params :name, :about, :city_id, :country_id, :website, :organizer, :papers, :lat, :lng, :to_date, :from_date, :category_id, photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :website
      input :organizer
      input :papers
      input :from_date
      input :to_date
      input :photos, as: :file, input_html: { multiple: true }
      input :lat
      input :lng
      input :category
      div :id => "admin-add-map"
    end
    actions
  end
end
