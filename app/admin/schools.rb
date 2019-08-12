ActiveAdmin.register School do

  permit_params :name, :professors, :about, :college_id, :university_id

  form do |f|
    inputs do
      input :name
      input :about
      input :professors
      input :college
      input :university
    end
    actions
  end
end
