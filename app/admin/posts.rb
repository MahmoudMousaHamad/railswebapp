ActiveAdmin.register Post do

  permit_params :title, :body, :cover_photo, :country_id, :city_id, :date_occurred

  form do |f|
    inputs do
      input :title
      input :body
      input :cover_photo, as: :file 
      input :city
      input :country
      input :date_occurred, as: :date_picker
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :city
      row :country
      row :date_occurred
      row :cover_photo do |c|
        div do
          image_tag image_path(main_app.url_for(post.cover_photo))
        end
      end
    end
  end
  
end
