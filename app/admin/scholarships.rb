ActiveAdmin.register Scholarship do
  menu parent: "Countries"

  permit_params :name, :about, :degree, :scholarship, :deadline, :university_id, :country_id, :category_id

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
    end
    actions
  end

  
  
end
