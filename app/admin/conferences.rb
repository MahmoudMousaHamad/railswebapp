ActiveAdmin.register Conference do

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
