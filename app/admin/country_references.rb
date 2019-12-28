ActiveAdmin.register CountryReference do
  menu parent: "Countries"

  # TODO:
  belongs_to :country, optional: true
  
  controller do
    def create
      @country_reference = CountryReference.new(permitted_params[:country_reference])
      @country_reference.user_id = current_user.id
      @country_reference.save
      super
    end
  end

  permit_params :title, :author, :publisher, :publication_year, :country_id, :reference_type,:user_id, :published

  form do |f|
    inputs do
      input :title
      input :author
      input :publisher
      input :publication_year
      input :reference_type, collection: ["Book", "Essay", "PhD or Master's Thesis"]
      input :country
      input :published if authorized? :publish, resource      
    end
    actions
  end
  
end
