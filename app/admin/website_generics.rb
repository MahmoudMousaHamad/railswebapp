ActiveAdmin.register WebsiteGeneric do
  
  permit_params :facebook_url, :twitter_url, :instagram_url, :about_us_content, :news_ticker
  
  controller do
    def update
      raise "You are not allowed to access this page!" if current_user.role != "superadmin"
      super
    end
  end

  form do |f|
    inputs do
      input :news_ticker, as: :quill_editor
      input :about_us_content, as: :quill_editor
      input :facebook_url, as: :url
      input :twitter_url, as: :url
      input :instagram_url, as: :url
    end
    actions
  end
end
