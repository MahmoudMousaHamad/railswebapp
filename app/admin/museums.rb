ActiveAdmin.register Museum do
  menu parent: "Countries"

  belongs_to :city, optional: true
  belongs_to :country, optional: true

  
  controller do
    def create
      @museum = Museum.new(permitted_params[:museum])
      @museum.user_id = current_user.id
      @museum.save
      super
    end
  end

  permit_params :name, :about, :city_id, :country_id, :website, :ticket_price, :working_hours, :lat, :lng, :logo, :kind, :user_id, :published, photos: []

  index do
    selectable_column 
    id_column
    column :name
    toggle_bool_column :published if authorized? :publish
    column :user
    actions
  end
  
  form do |f|
    inputs do
      input :name
      input :about, as: :quill_editor
      input :city
      input :country
      input :website
      input :ticket_price
      input :working_hours, as: :quill_editor
      input :logo, as: :file, input_html: { accept: 'image/png,image/gif,image/jpeg' }
      input :photos, as: :file, input_html: { multiple: true, accept: 'image/png,image/gif,image/jpeg' }
      input :kind, collection: ["Archaeological", "Heritage", "Other"]
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
      row :website
      row :ticket_price
      row :working_hours
      row :lat
      row :lng
      row :photos do
        museum.photos.each do |p|
          span do
            image_tag image_path(main_app.url_for(p)), class: "image-admin"
          end
        end
      end
    end
  end
  
end
