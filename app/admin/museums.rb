ActiveAdmin.register Museum do

  permit_params :name, :about, :city_id, :country_id, :website, :ticket_price, :working_hours, :lat, :lng, photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :website
      input :ticket_price
      input :working_hours
      input :lat
      input :lng
      input :photos, as: :file, input_html: { multiple: true }
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :about
      row :city
      row :country
      row :website
      row :ticket_price
      row :working_hours
      row :lat
      row :lng
      row :photos do
        museum.photos.each do |p|
          div do
            image_tag image_path(main_app.url_for(p))
          end
        end
      end
    end
  end
  
end
