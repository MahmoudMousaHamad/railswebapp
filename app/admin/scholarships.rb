ActiveAdmin.register Scholarship do

  permit_params :name, :about, :degree, :scholarship, :deadline, :university_id, :country_id

  form do |f|
    inputs do
      input :name
      input :about
      input :degree
      input :scholarship
      input :deadline
      input :university
      input :country
    end
    actions
  end

  
  
end
