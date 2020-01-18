ActiveAdmin.register IslamicPeriod do

  permit_params :name, :about, :start_year, :end_year, :slideshow_photos => []

  index do
    selectable_column 
    id_column
    column :name
    column :published
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
    end
    actions
  end
  
end
