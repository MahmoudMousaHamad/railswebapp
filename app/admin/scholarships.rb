ActiveAdmin.register Scholarship do
  menu parent: "Countries"

  belongs_to :country, optional: true
  belongs_to :university, optional: true
  
  controller do
    def create
      @schoolarship = Schoolarship.new(permitted_params[:schoolarship])
      @schoolarship.user_id = current_user.id
      @schoolarship.save
      super
    end
  end

  permit_params :name, :about, :degree, :scholarship, :deadline, :university_id, :country_id, :category_id, :user_id, :published

  form do |f|
    inputs do
      input :name
      input :about
      input :degree
      input :scholarship
      input :deadline
      input :university
      input :country
      input :category
      input :published if authorized? :publish, resource
    end
    actions
  end

  
  
end
