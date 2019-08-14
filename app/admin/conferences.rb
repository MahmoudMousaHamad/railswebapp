ActiveAdmin.register Conference do

  permit_params :name, :about, :city_id, :country_id, :website, :organizer, :papers, :lat, :lng, :date_time

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :website
      input :organizer
      input :papers
      input :date_time
      input :lat
      input :lng
      div :id => "admin-add-map"
    end
    actions
  end
end
