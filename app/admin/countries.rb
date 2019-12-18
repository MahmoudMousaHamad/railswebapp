ActiveAdmin.register Country do
  extend DeleteImage

  controller do
    def create
      @country = Country.new(permitted_params[:country])
      @country.user_id = current_user.id
      @country.save
      super
    end
  end
  
  permit_params :name, :about, :lat, :lng, :published, slideshow_photos: [], gallery_photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :slideshow_photos, as: :file, input_html: { multiple: true }
      country.slideshow_photos.each do |p|
        div class: "delete-image-wrap" do
          span class: "delete-image" do
            link_to "&times;".html_safe,
            delete_photo_admin_country_path(p.id),
            method: :delete,
            data: { confirm: 'Are you sure?' }
          end
          span image_tag image_path(main_app.url_for(p)), class: "image-admin"
        end
      end

      input :gallery_photos, as: :file, input_html: { multiple: true }
      country.gallery_photos.each do |p|
        div class: "delete-image-wrap" do
          span class: "delete-image" do
            link_to "&times;".html_safe,
            delete_photo_admin_country_path(p.id),
            method: :delete,
            data: { confirm: 'Are you sure?' }
          end
          span image_tag image_path(main_app.url_for(p)), class: "image-admin"
        end
      end
      input :published
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
      row :slideshow_photos do
        country.slideshow_photos.each do |p|
          span image_tag image_path(main_app.url_for(p)), class: "image-admin"
        end
      end
    end
  end
end
