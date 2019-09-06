ActiveAdmin.register College do

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
