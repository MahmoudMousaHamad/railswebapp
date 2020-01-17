ActiveAdmin.register Conference do

  belongs_to :country, optional: true

  menu parent: "Countries"

  controller do
    def create
      @conference = Conference.new(permitted_params[:conference])
      @conference.user_id = current_user.id
      @conference.save
      super
    end
  end

  permit_params :name, :about, :city_id, :country_id, :website, :organizer, :papers, :lat, :lng, :to_date, :from_date, :category_id, :published, photos: []

  form do |f|
    inputs do
      input :name
      input :about, as: :quill_editor
      input :city
      input :country
      input :website
      input :organizer
      input :papers
      input :from_date, as: :date_picker
      input :to_date, as: :date_picker
      input :photos, as: :file, input_html: { multiple: true }
      input :category
      input :published if authorized? :publish, resource
      input :lat
      input :lng
      div :id => "admin-add-map"
    end
    actions
  end
end
