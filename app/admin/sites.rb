ActiveAdmin.register Site do
  menu parent: "Countries"
  extend DeleteImage

  controller do
    def create
      @site = Site.new(permitted_params[:site])
      @site.user_id = current_user.id
      @site.save
      super
    end
  end

  permit_params :name, :about, :city_id, :country_id, :lat, :lng, :user_id, :published, slideshow_photos: [], gallery_photos: []

  form do |f|
    inputs do
      input :name
      input :about
      input :city
      input :country
      input :slideshow_photos, as: :file, input_html: { multiple: true }
      site.slideshow_photos.each do |p|
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

      input :gallery_photos, as: :file, input_html: { multiple: true }
      site.gallery_photos.each do |p|
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
      input :published if authorized? :publish, resource
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
      row :slideshow_photos do
        site.slideshow_photos.each do |p|
          span image_tag image_path(main_app.url_for(p)), class: "image-admin"
        end
      end
    end
  end
  
end
