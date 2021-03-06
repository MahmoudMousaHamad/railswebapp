ActiveAdmin.register User do
  menu parent: "Admin"

  permit_params :name, :email, :password, :password_confirmation, :role, :country, :verified,
                :phone_number, :dob, :gender, :profile_photo, :cv, :education_level, :specialization, :about, :resource_permissions

  index do
    selectable_column 
    id_column
    column :name
    column :email
    column :country
    column :education_level
    column :specialization
    toggle_bool_column :verified
    actions
  end

  Rails.application.eager_load!
  model_names = ApplicationRecord.descendants
  
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :role, collection: ["superadmin", "leader", "member"], :label => "User Role"
      f.input :country, as: :country, format: :with_data_attr
      f.input :phone_number
      f.input :dob, label: "Date of Birth"
      f.input :gender, collection: ["Male", "Female"]
      f.input :profile_photo, as: :file
      f.input :cv, as: :file, label: "C.V."
      f.input :education_level, collection: ["PhD", "Master's", "Bachelor's"]
      f.input :specialization, collection: Discipline.all.map{|d| d.name }
      f.input :about, as: :quill_editor
      f.input :resource_permissions, collection: model_names, as: :tags
      f.input :verified if authorized? :edit, user
    end
    actions
  end

end