ActiveAdmin.register Video do
  menu parent: "Countries"

  controller do
    def create
      @video = Video.new(permitted_params[:video])
      @video.user_id = current_user.id
      @video.save
      super
    end
  end

  permit_params :title, :link, :country_id, :city_id, :site_id, :user_id
  
end
