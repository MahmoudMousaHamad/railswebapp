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
  
  index do
    id_column
    column :name
    column :published
    actions
  end

  index as: :grid do |country|
    link_to  content_tag(:img, nil, :src => "https://www.countryflags.io/#{NormalizeCountry(country.name, to: :alpha2)}/flat/64.png"), 
                          admin_country_path(country), class: "flag-list-link", title: country.name
  end

  permit_params :name, :about, :lat, :lng, :published, slideshow_photos: [], gallery_photos: []

  form do |f|
    inputs do
      f.input :name, as: :country, format: :with_data_attr
      input :about, as: :quill_editor
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
          span image_tag image_path(main_app.url_for(p)), class: "image-admin" if country.slideshow_photos.attached?
        end
      end
    end
    panel "Related to this country" do
      div nested_resource_links_for(country, "country", ["cities", "museums", "conferences", "scholarships", "posts", "universities", "videos", "country_references"])
    end
  end
end
