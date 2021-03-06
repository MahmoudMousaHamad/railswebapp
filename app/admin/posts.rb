ActiveAdmin.register Post do
  menu parent: "Countries"

  belongs_to :country, optional: true
  belongs_to :city, optional: true

  
  controller do
    def create
      @post = Post.new(permitted_params[:post])
      @post.user_id = current_user.id
      @post.save
      super
    end
  end

  permit_params :title, :body, :cover_photo, :country_id, :city_id, :date_occurred, :user_id, :published

  form do |f|
    inputs do
      input :title
      input :body, as: :quill_editor
      input :cover_photo, as: :file 
      input :city
      input :country
      input :date_occurred, as: :date_picker
      input :published if authorized? :publish, resource
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
          image_tag image_path(main_app.url_for(post.cover_photo)) if post.cover_photo.attached?
        end
      end
    end
  end
  
end
