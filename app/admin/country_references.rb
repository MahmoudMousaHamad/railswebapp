ActiveAdmin.register CountryReference do

  permit_params :title, :author, :publisher, :publication_date, :country_id, :period
  
end
