ActiveAdmin.register City do

  permit_params :name, :tagline, :country_id, photos: []
  
  form do |f|
    inputs do
      input :name
      input :tagline
      input :country
      input :photos, as: :file, input_html: { multiple: true }
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :tagline
      row :country
      row :photos do
        city.photos.each do |p|
          div do
            image_tag image_path(main_app.url_for(p))
          end
        end
      end
    end
  end
  
end
