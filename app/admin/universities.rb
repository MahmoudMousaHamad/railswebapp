ActiveAdmin.register University do

  permit_params :name, :about, :city_id, :country_id, :logo, photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :logo, as: :file
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
      row :logo do |c|
        div do
          image_tag image_path(main_app.url_for(university.logo))
        end
      end
      row :photos do
        university.photos.each do |p|
          div do
            image_tag image_path(main_app.url_for(p))
          end
        end
      end
    end
  end
  
end
