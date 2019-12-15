ActiveAdmin.register_page "Dashboard" do
  menu false

  content title: proc { I18n.t("active_admin.dashboard") } do
    if current_user.role = "superadmin"
      
    elsif current_user.role = "leader"
      
    elsif current_user.role = "member"

    end
  end 
end
