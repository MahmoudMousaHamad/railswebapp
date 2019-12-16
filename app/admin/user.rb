ActiveAdmin.register User do
  menu parent: "Admin"

  permit_params :name, :email, :password, :password_confirmation, :role, :country, :verified

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, collection: ["superadmin", "leader", "member"], :label => "User Role"
      f.input :country, as: :country, format: :with_data_attr
      f.input :verified
    end
    actions
  end

end