ActiveAdmin.register Site do

  extend DeleteImage

  permit_params :name, :about, :city_id, :country_id, :lat, :lng, photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :photos, as: :file, input_html: { multiple: true }
      site.photos.each do |p|
        div class: "delete-image-wrap" do
          span class: "delete-image" do
            link_to "&times;".html_safe,
            delete_photo_admin_site_path(p.id),
            method: :delete,
            data: { confirm: 'Are you sure?' }
          end
          span image_tag image_path(main_app.url_for(p)), class: "image-admin"
        end
      end
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
          span image_tag image_path(main_app.url_for(p)), class: "image-admin"
        end
      end
    end
  end
  
end
