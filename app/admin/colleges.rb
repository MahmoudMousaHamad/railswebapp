ActiveAdmin.register College do
  menu parent: "Countries"

  belongs_to :university, optional: true

  controller do
    def create
      @college = College.new(permitted_params[:college])
      @college.user_id = current_user.id
      @college.save
      super
    end
  end

  permit_params :name, :about, :university_id, :lat, :lng, :logo, :published
  
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
      input :university
      input :logo, as: :file
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
      row :university
      row :published
    end
    panel "Schools of this college" do
      div nested_resource_links_for(college, "college", ["schools"])
    end
  end
end
