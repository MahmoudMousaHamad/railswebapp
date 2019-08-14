ActiveAdmin.register Site do

  permit_params :name, :about, :city_id, :country_id, :lat, :lng, photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :photos, as: :file, input_html: { multiple: true }
      input :lat
      input :lng
      div :id => "admin-add-map"
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :about
      row :city
      row :country
      row :photos do
        site.photos.each do |p|
          div do
            image_tag image_path(main_app.url_for(p))
          end
        end
      end
    end
  end
  
end
