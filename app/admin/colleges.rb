ActiveAdmin.register College do

  permit_params :name, :about, :university_id
  
  form do |f|
    inputs do
      input :name
      input :about
      input :university
    end
    actions
  end
end
