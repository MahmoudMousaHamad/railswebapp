ActiveAdmin.register Conference do

  permit_params :name, :about, :city_id, :country_id, :website, :organizer, :papers, :lat, :lng, :to_date, :from_date, :category_id

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
      input :lat
      input :lng
      input :category
      div :id => "admin-add-map"
    end
    actions
  end
end
