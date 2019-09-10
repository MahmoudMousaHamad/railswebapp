ActiveAdmin.register Country do

  permit_params :name, :about, :lat, :lng, photos: []

  form do |f|
    inputs do
      input :name
      input :about
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
      row :lat
      row :lng
      row :photos do
        country.photos.each do |p|
          div do
            image_tag image_path(main_app.url_for(p))
          end
        end
      end
    end
  end
end
