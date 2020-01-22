ActiveAdmin.register IslamicPeriod do

  controller do
    def create
      @islamic_period = IslamicPeriod.new(permitted_params[:islamic_period])
      @islamic_period.user_id = current_user.id
      @islamic_period.save
      super
    end
  end

  permit_params :name, :about, :start_year, :end_year, :published, :slideshow_photos => []

  index do
    selectable_column 
    id_column
    column :name
    toggle_bool_column :published
    column :user
    actions
  end
  
  form do |f|
    inputs do
      input :name
      input :about, as: :quill_editor
      input :start_year
      input :end_year
      input :slideshow_photos, as: :file, input_html: { multiple: true, accept: 'image/png,image/gif,image/jpeg' }
      input :published
    end
    actions
  end
  
end
