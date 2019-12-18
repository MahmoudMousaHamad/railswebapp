ActiveAdmin.register CountryReference do
  menu parent: "Countries"

  controller do
    def create
      @country_reference = CountryReference.new(permitted_params[:country_reference])
      @country_reference.user_id = current_user.id
      @country_reference.save
      super
    end
  end

  permit_params :title, :author, :publisher, :publication_date, :country_id, :period, :user_id, :published

  form do |f|
    inputs do
      input :title
      input :author
      input :publisher
      input :publication_date
      input :country
      input :period
      input :published if authorized? :publish, resource      
    end
    actions
  end
  
end
